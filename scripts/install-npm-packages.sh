#!/usr/bin/env bash

# yarn
if [ -f /home/vagrant/.yarn-installed ]
then
  echo "Yarn already installed"
else
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
fi

touch /home/vagrant/.yarn-installed
apt-get update && apt-get install -y yarn

# forever
npm install -g forever

# pm2
npm install -g pm2

# nodemon
npm install -g nodemon

# gulp
npm install -g gulp-cli
