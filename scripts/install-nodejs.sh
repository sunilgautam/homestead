#!/usr/bin/env bash

if [ -f /home/vagrant/.nodejs ]
then
    echo "NodeJs already installed."
    exit 0
fi

touch /home/vagrant/.nodejs

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
