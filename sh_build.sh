#!/bin/bash
B_N=${BUILD_NUMBER}
if [ -z "$B_N" ]
then
    B_N=1    
else
    ((B_N+=1))  
fi
eval $(minikube docker-env)
docker build -t learn-k8s/demo:$B_N .
docker tag learn-k8s/demo:$B_N learn-k8s/demo:latest
docker image ls
export BUILD_NUMBER=$B_N