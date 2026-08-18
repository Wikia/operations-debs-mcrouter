#!/usr/bin/env bash
# based of scripts in https://github.com/facebook/mcrouter/tree/master/mcrouter/scripts
set -ex

mcrouter_version="v2026.08.10.00"
fmtlib_version="11.0.2"
fast_float_version="v8.0.2"

# limit the number of parallel compilation processes to avoid OOM crashes
parallel_cap=50

#dir=$(mktemp -d  -p /var/tmp)
dir=/var/tmp/tmp.AJvPCDTbXG
shared_dir="/build"
pkg_dir="${dir}/pkgs"
install_dir="${dir}/install"
cores=$(grep processor /proc/cpuinfo | wc -l)
parallel="-j$(($cores>$parallel_cap ? $parallel_cap : $cores))"

export LDFLAGS="-L${install_dir}/lib -ldl -ljemalloc $LDFLAGS"
export CPPFLAGS="-I${install_dir}/include -O2 -ftree-vectorize -pipe -g $CPPFLAGS"
export CXXFLAGS="${CPPFLAGS}"
export CFLAGS="${CFLAGS}"

export DEBIAN_FRONTEND=noninteractive
export TZ=Etc/UTC

function build_git {
  repo=$1
  checkout=$2
  cmake_extra=$3
  cmake_dir=${4:-.}
  build_dir=$5
  cxxflags=$6
  checkout_dir=$( sed s'/.git$//' <<<"${repo##*/}")
  [ -z "${build_dir}" ] && build_dir=${checkout_dir}

  [ -d "${checkout_dir}" ] || git clone "${repo}"
  pushd "${checkout_dir}"
  [ -n "${checkout}" ] && git checkout "${checkout}"
  popd

  mkdir -p "${pkg_dir}/${build_dir}"
  pushd "${pkg_dir}/${build_dir}"
  cmake_args="${cmake_extra} -DCMAKE_INSTALL_PREFIX=${install_dir} -DCMAKE_POLICY_VERSION_MINIMUM=3.10 -DCMAKE_INCLUDE_PATH=${install_dir}/include -DCMAKE_LIBRARY_PATH=${install_dir}/lib"
  CXXFLAGS="$CXXFLAGS ${cxxflags}" \
    LD_LIBRARY_PATH="$install_dir/lib:$LD_LIBRARY_PATH" \
    LD_RUN_PATH="$install_dir/lib:$LD_RUN_PATH" \
    cmake ${cmake_args} "${cmake_dir}"
  make ${parallel}
  make install
  popd
}

function build_mcrouter {
  pushd "${pkg_dir}/mcrouter/mcrouter"
  autoreconf --install
  # distutils is deprecated and the warning message breaks ./configure
  sed -i 's/PYTHON -c /PYTHON -W ignore::DeprecationWarning -c /g' configure
  LD_LIBRARY_PATH="${install_dir}/lib:$LD_LIBRARY_PATH" \
    LD_RUN_PATH="${install_dir}/lib:$LD_RUN_PATH" \
    LDFLAGS="-L${install_dir}/lib $LDFLAGS" \
    CPPFLAGS="-I${install_dir}/include $CPPFLAGS" \
    FBTHRIFT_BIN="${install_dir}/bin/" \
    INSTALL_DIR="${install_dir}" \
    ./configure --prefix="${shared_dir}/mcrouter"
  make ${parallel}
  make install
  popd
}

mkdir -p "${pkg_dir}" "${install_dir}"

STEP=${1:-all}

case $STEP in
  fmt)
    cd "${pkg_dir}"
    build_git https://github.com/fmtlib/fmt \
      "${fmtlib_version}" "-DFMT_TEST=0" ".." "fmt/fmt" "-fPIC"
    ;;
  fast_float)
    cd "${pkg_dir}"
    build_git https://github.com/fastfloat/fast_float \
      "${fast_float_version}" "" ".." "fast_float/build"
    ;;
  folly)
    cd "${pkg_dir}"
    build_git https://github.com/facebook/folly \
      "" "" ".." "folly/folly" "-fPIC"
    ;;
  fizz)
    cd "${pkg_dir}"
    build_git https://github.com/facebookincubator/fizz \
      "" "-DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF" "." "fizz/fizz"
    ;;
  wangle)
    cd "${pkg_dir}"
    build_git https://github.com/facebook/wangle \
      "" "-DBUILD_TESTS=OFF" "." "wangle/wangle"
    ;;
  mvfst)
    cd "${pkg_dir}"
    build_git https://github.com/facebook/mvfst \
      "" "-DBUILD_TESTS=OFF" "."
    ;;
  fbthrift)
    cd "${pkg_dir}"
    build_git https://github.com/facebook/fbthrift \
      "" "" ".." "fbthrift/build" "-fPIC"
    ;;
  mvfst_clone)
    cd "${pkg_dir}"
    [ -d mvfst ] || git clone https://github.com/facebook/mvfst
    ;;
  mcrouter_clone)
    cd "${pkg_dir}"
    [ -d mcrouter ] || git clone https://github.com/facebook/mcrouter.git
    pushd mcrouter
    [ -z "${mcrouter_version}" ] || git checkout "${mcrouter_version}"
    popd
    ;;
  mcrouter)
    cd "${pkg_dir}"
    build_mcrouter
    cd "${shared_dir}/mcrouter"
    dpkg-buildpackage -us -uc
    ;;
  all)
    "$0" fmt
    "$0" fast_float
    "$0" folly
    "$0" fizz
    "$0" wangle
    "$0" mvfst
    "$0" fbthrift
    "$0" mcrouter
    ;;
  *)
    echo "Unknown step: $STEP" >&2
    echo "Valid steps: fmt fast_float folly fizz wangle mvfst fbthrift mcrouter all" >&2
    exit 1
    ;;
esac
