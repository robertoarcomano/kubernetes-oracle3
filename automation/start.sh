#!/bin/bash

# C. Constants
NS=automation
AUTOMATION_NS=automation-ns.yaml
RUNDECK_DEPLOY=rundeck-deploy.yaml
RUNDECK_SERVICE=rundeck-service.yaml
now="--grace-period=0 --force"

# 0. Reset
kubectl delete ns $NS $now

# 1. Create ns
kubectl create ns $NS

# 2. Create rundeck deploy
kubectl apply -f $RUNDECK_DEPLOY

# 3. Create rundeck service
kubectl apply -f $RUNDECK_SERVICE

# 4. Show everything
kubectl -n $NS get all --show-labels
