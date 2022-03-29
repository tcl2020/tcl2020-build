set -e
rm -rf sqlite 
mkdir sqlite 
cd sqlite 
curl https://www.sqlite.org/2022/sqlite-autoconf-3380000.tar.gz | tar -xzf -
