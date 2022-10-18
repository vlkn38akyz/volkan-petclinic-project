#!/bin/bash
hostnamectl set-hostname ${server-name}
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo yum install git -y
sudo yum install java-11-amazon-corretto -y
git clone https://github.com/clarusway/petclinic-microservices-with-db.git
git checkout dev