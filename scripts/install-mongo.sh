#!/usr/bin/env bash

if [ -f /home/vagrant/.mongo-installed ]
then
    echo "MongoDB already installed."
    exit 0
fi

touch /home/vagrant/.mongo-installed

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

apt-get update && apt-get install -y --allow-unauthenticated mongodb-org

sudo sed -i "s/bindIp: .*/bindIp: 0.0.0.0/" /etc/mongod.conf

sudo service mongod restart
