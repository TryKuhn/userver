#!/bin/sh

if [ "$(uname)" = "Darwin" ]; then
  sudo apt install -y default-jre
else
  sudo brew install openjdk
fi

if ! [ -v "$(KAFKA_PATH)" ]; then
  if [ "$(uname)" = "Darwin" ]; then
    export KAFKA_PATH="/opt/homebrew/opt/kafka/libexec"
  else
    export KAFKA_PATH="/etc/kafka"
  fi
fi

curl https://dlcdn.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz -o kafka.tgz
mkdir -p $KAFKA_PATH
tar xf kafka.tgz --directory=$KAFKA_PATH
cp -r /etc/kafka/kafka_2.13-3.8.0/* $KAFKA_PATH
rm -rf /etc/kafka/kafka_2.13-3.8.0
rm kafka.tgz
