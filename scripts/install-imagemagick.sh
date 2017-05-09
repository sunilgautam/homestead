#!/usr/bin/env bash

if [ -f /home/vagrant/.imagemagick ]
then
    echo "ImageMagick already installed."
    exit 0
fi

touch /home/vagrant/.imagemagick

apt-get install imagemagick -y
