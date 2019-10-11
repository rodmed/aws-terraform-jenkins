#!/bin/bash

#O nome do Device xvdh deveria vir de uma variável
set -xe
if [ "$(file -b -s /dev/xvdh)" == "data" ]; then
 mkfs -t ext4 /dev/xvdh
fi

if ! mountpoint -q /data; then
 mkdir -p /var/lib/jenkins
 mount /dev/xvdh /var/lib/jenkins
 echo /dev/xvdh /var/lib/jenkins ext4 defaults,nofail 0 2 >> /etc/fstab
fi

#idealmente usar o cloud init para separar os scritps

# Add Repositorio jenkins via apt-get
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
apt-get update

#Dependencia do jenkins  java8, java 11 é uma opção porém não está testado com todos os plugins existentes
apt-get install -y openjdk-8-jre

#seria melhor fixar uma versão, mas estamos instalando a mais recente no momento.
#2.190.1 de 25/09/2019
apt-get install -y jenkins

systemctl enable jenkins
systemctl start jenkins 