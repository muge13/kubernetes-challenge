#!/bin/bash

# echo "Install Docker"
set -x
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker "$(id -gn)"
# sg "$(id -gn)" -c "groups"

# echo "Start docker service"
sudo systemctl start docker

# echo "Confirm service"
sg "$(id -gn)" -c "docker info"

# echo "Additional Setup"
sudo mkdir -p /usr/local/bin/

# echo "Install Docker compose"
curl -o docker-compose https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m) && chmod +x docker-compose
sudo install docker-compose /usr/local/bin/

# echo "Install minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
sudo install minikube /usr/local/bin/

# echo "Start minikube"
sg "$(id -gn)" -c "minikube start --driver=docker"
sg "$(id -gn)" -c "minikube addons enable ingress"
sg "$(id -gn)" -c "minikube status"


# echo "Install kubectl"
sudo apt update && sudo apt install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

# Clean up
rm -f docker-compose minikube

set +x