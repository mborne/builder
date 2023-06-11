#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

#------------------------------------------------------------------------------------------
# install common helper tools
#------------------------------------------------------------------------------------------
sudo apt-get install -y \
  build-essential # make \
  jq \
  wget curl

#------------------------------------------------------------------------------------------
# allows to use builder as a jenkins node
#------------------------------------------------------------------------------------------
sudo apt-get install -y openjdk-11-jdk-headless

#------------------------------------------------------------------------------------------
# docker
#------------------------------------------------------------------------------------------
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#sudo mkdir -p /etc/apt/keyrings
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
curl -sS https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo \
  "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo adduser vagrant docker

#------------------------------------------------------------------------------------------
# multiarch build
# https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408
#------------------------------------------------------------------------------------------
sudo apt-get install -y qemu-user-static
sudo apt-get install -y binfmt-support
# sudo docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

sudo docker buildx create --name builder
sudo docker buildx use builder
sudo docker buildx inspect --bootstrap
sudo docker buildx ls


