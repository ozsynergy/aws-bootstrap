#!/bin/bash

# Install docker and NGINX on fresh ubuntu EC2 Image
# Download docker image  

# Install Docker
apt-get update
apt-get -y install apt-transport-https ca-certificates
echo "Y" | sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >  /etc/apt/sources.list.d/docker.list
apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get -y install docker-engine
sudo service docker start
sudo usermod -aG docker ubuntu
sudo systemctl enable docker

# Install NGINX
apt-get -y install nginx

# configure nginx as reverse proxy
# copy config to  /etc/nginx/sites-available/default

# configure node app docker container to start on boot
# copy cofig to   /etc/init/wordapp.conf

sudo initctl reload-configuration
sudo service nginx restart
sudo service wordapp start
docker pull  docker pull synergy/nodejs-word-application
