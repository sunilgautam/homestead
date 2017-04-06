#!/usr/bin/env bash

if [ -f /home/vagrant/.redis-installed ]
then
    echo "Redis already installed."
    exit 0
fi

touch /home/vagrant/.redis-installed

wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
make install
cd utils
./install_server.sh
update-rc.d redis_6379 defaults
service redis_6379 start
