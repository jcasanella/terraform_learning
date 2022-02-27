#!/bin/bash

KAFKA_HOME=/usr/local/kafka

sudo yum update
sudo tar cvfz kafka.tgz -C ${KAFKA_HOME} && rm kafka.tgz

echo "PATH=${KAKFA_HOME}/bin:${PATH}"