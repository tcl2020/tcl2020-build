apt-get update -qq

apt-get install -y git gcc-7 g++-7 make curl automake autoconf \
    minizip vim libreadline-dev libtool cmake libyajl-dev \
    libssl-dev openssl libpq-dev libzookeeper-mt-dev \
    libboost-all-dev librdkafka-dev libuv1-dev swig3.0 \
    libgd-dev pkg-config gdb libcurl4-openssl-dev

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --set cc /usr/bin/gcc-7
update-alternatives --set c++ /usr/bin/g++-7

dpkg-query -l 2>&1 | sed "s,^,package-selections: ,"

