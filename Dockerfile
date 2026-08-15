FROM ubuntu:resolute
ENV DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC
RUN apt-get update && apt-get install -y \
    autoconf \
    binutils-dev \
    bison \
    cmake \
    flex \
    g++ \
    gcc \
    git \
    libboost-all-dev \
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
    libzstd-dev \
    libtool \
    libunwind-dev \
    zlib1g-dev \
    make \
    ninja-build \
    pkg-config \
    python3-dev \
    python-is-python3 \
    python-dev-is-python3 \
    python3-setuptools \
    python3-six \
    dpkg-dev \
    debhelper \
    ragel \
    ca-certificates \
    build-essential
COPY docker_entry.sh /docker_entry.sh
RUN /docker_entry.sh fmt
RUN /docker_entry.sh fast_float
RUN /docker_entry.sh folly
RUN /docker_entry.sh fizz
RUN /docker_entry.sh wangle
RUN /docker_entry.sh mvfst
RUN /docker_entry.sh fbthrift
COPY mcrouter/ /build/mcrouter/
RUN /docker_entry.sh mcrouter
