apt-get update -qq

apt-get install -y git gcc-7 g++-7 make curl automake autoconf minizip vim libreadline-dev libtool

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --set cc /usr/bin/gcc-7
update-alternatives --set c++ /usr/bin/g++-7

dpkg-query -l 2>&1 | sed "s,^,package-selections: ,"

# Run a program that sleeps forever so that we can run the docker container instance
# as a build server.
echo "int main(int c, char *v) { while (1) { sleep(1000000); } }" >/root/sleep_forever.c && \
    gcc -Wno-implicit-function-declaration -o /bin/sleep_forever_in_docker /root/sleep_forever.c
