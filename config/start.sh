#!/bin/bash

# C. Constants
NS=config
NOW="--grace-period=0 --force"

# 0. Re-create namespace
kubectl delete ns $NS $NOW
kubectl create ns $NS

kubectl create -n $NS secret generic gitlab-registry-auth \
  --from-file=.dockerconfigjson=$HOME/.docker/config.json \
  --type=kubernetes.io/dockerconfigjson

