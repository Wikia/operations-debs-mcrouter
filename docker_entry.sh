#!/usr/bin/env bash
# based of scripts in https://github.com/facebook/mcrouter/tree/master/mcrouter/scripts
set -ex

mcrouter_version="v2022.05.09.00"
fb_zstd_version="v1.5.2"
fmtlib_version="8.1.1"
googletest_version="v1.10.x"

# limit the number of parallel compilation processes to avoid OOM crashes
parallel_cap=4

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

apt-get update

# could create an image with these preloaded
apt-get install -y \
    autoconf \
    binutils-dev \
    bison \
    cmake \
    flex \
    g++ \
    gcc \
    git \
    libboost1.65-all-dev \
    libbz2-dev \
    libdouble-conversion-dev \
    libevent-dev \
    libgflags-dev \
    libgtest-dev \
    libgoogle-glog-dev \
    libjemalloc-dev \
    liblz4-dev \
    liblzma-dev \
    liblzma5 \
    libsnappy-dev \
    libsodium-dev \
    libssl-dev \
    libtool \
    libunwind8-dev \
    zlib1g-dev \
    make \
    pkg-config \
    python-dev \
    python-six \
    dpkg-dev \
    debhelper \
    ragel \
    ca-certificates \
    build-essential

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
  cmake_args="${cmake_extra} -DCMAKE_INSTALL_PREFIX=${install_dir} ${parallel}"
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
  LD_LIBRARY_PATH="${install_dir}/lib:$LD_LIBRARY_PATH" \
    LD_RUN_PATH="${install_dir}/lib:$LD_RUN_PATH" \
    LDFLAGS="-L${install_dir}/lib $LDFLAGS" \
    CPPFLAGS="-I${install_dir}/include $CPPFLAGS" \
    FBTHRIFT_BIN="${install_dir}/bin/" \
    ./configure --prefix="${shared_dir}/mcrouter"
  make ${parallel}
  make install
  popd
}

mkdir -p "${pkg_dir}" "${install_dir}"
pushd "${pkg_dir}"
[ -d "${pkg_dir}/mcrouter" ] || git clone https://github.com/facebook/mcrouter.git
pushd "${pkg_dir}/mcrouter"
[ -z "${mcrouter_version}" ] || git checkout "${mcrouter_version}"
popd

mcrouter_base="${pkg_dir}/mcrouter/mcrouter"

build_git https://github.com/fmtlib/fmt \
  "${fmtlib_version}" "-DFMT_TEST=0" ".." "fmt/fmt" "-fPIC"

# Prepare Googletest for mcrouter itself, after fmtlib since that one ships its own via a submodule.
build_git https://github.com/google/googletest \
  "${googletest_version}" "" "." "googletest"

build_git https://github.com/facebook/folly \
  "${mcrouter_version}" "" ".." "folly/folly" "-fPIC"

# You have build zstd after folly or you're gonna have a bad time
# (mcrouter's libzstd dependency won't be static and the binary won't work on bionic ¯\_(ツ)_/¯)
build_git https://github.com/facebook/zstd \
  "${fb_zstd_version}" "" "build/cmake" "zstd"

build_git https://github.com/facebookincubator/fizz \
  "${mcrouter_version}" "-DBUILD_TESTS=OFF" "." "fizz/fizz"

build_git https://github.com/facebook/wangle \
  "${mcrouter_version}" "-DBUILD_TESTS=OFF" "." "wangle/wangle"

build_git https://github.com/facebook/fbthrift \
  "${mcrouter_version}" "" ".."  "fbthrift/build" "-fPIC"

build_mcrouter "${mcrouter_version}"

pushd "${shared_dir}/mcrouter"
dpkg-buildpackage -us -uc
