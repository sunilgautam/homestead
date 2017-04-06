#!/usr/bin/env bash

if [ -f /home/vagrant/.elastic-installed ]
then
    echo "Elastic already installed."
    exit 0
fi

touch /home/vagrant/.elastic-installed

# Java
add-apt-repository ppa:webupd8team/java -y
apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
apt-get install oracle-java8-installer -y

# Elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
apt-get install -y apt-transport-https
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
apt-get update
apt-get install -y elasticsearch
apt-get install -y kibana
update-rc.d elasticsearch defaults 95 10
update-rc.d kibana defaults 95 10

echo 'network.host: 0.0.0.0
http.port: 9200
transport.host: localhost
transport.tcp.port: 9300' >> /etc/elasticsearch/elasticsearch.yml
sed -i 's~#server.host: .*~server.host: 0.0.0.0~' /etc/kibana/kibana.yml
sed -i 's~#elasticsearch.url: .*~elasticsearch.url: "http://192.168.10.10:9200"~' /etc/kibana/kibana.yml
sed -i 's/-Xms[0-9]g/-Xms128m/' /etc/elasticsearch/jvm.options
sed -i 's/-Xmx[0-9]g/-Xmx512m/' /etc/elasticsearch/jvm.options

sudo -i service elasticsearch start
sudo -i service kibana start
