export DEBIAN_FRONTEND=noninteractive
set -e

apt-get update -qq

apt-get upgrade -q -y -u \
	       -o Dpkg::Options::=--force-confold \
	       -o Dpkg::Options::=--force-confdef \
	       --allow-downgrades --allow-remove-essential --allow-change-held-packages

apt-get install -y wget gpg

# cmake apt source setup
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | \
	gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null
apt-get update -qq
rm /usr/share/keyrings/kitware-archive-keyring.gpg
apt-get install -y kitware-archive-keyring

echo "here come the installs"
apt-get install -y git gcc-10 g++-10 cpp-10 make curl automake autoconf \
    minizip vim libreadline-dev libtool python3-pip python3-venv \
    libssl-dev openssl libpq-dev libzookeeper-mt-dev \
    libboost-all-dev libuv1-dev swig3.0 libyajl-dev \
    libgd-dev pkg-config gdb libcurl4-openssl-dev \
    libmemcached-dev libxml2-dev libxslt-dev apache2-dev apache2 \
    libgeos-dev libproj-dev libbsd-dev lsb-release cmake

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 \
	--slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov gcov /usr/bin/gcov-10

dpkg-query -l 2>&1 | sed "s,^,package-selections: ,"
