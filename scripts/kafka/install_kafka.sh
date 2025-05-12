#!/bin/sh

if (($OS == 'ubuntu')) ; then
  sudo apt install -y default-jre
else
  sudo brew install openjdk
fi

curl https://dlcdn.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz -o kafka.tgz
mkdir -p $kafka_path
tar xf kafka.tgz --directory=$kafka_path
cp -r /etc/kafka/kafka_2.13-3.8.0/* $kafka_path
rm -rf /etc/kafka/kafka_2.13-3.8.0
rm kafka.tgz
