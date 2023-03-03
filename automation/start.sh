#!/bin/bash

# C. Constants
AUTOMATION_NS=automation-ns.yaml
RUNDECK_DEPLOY=rundeck-deploy.yaml
RUNDECK_SERVICE=rundeck-service.yaml
now="--grace-period=0 --force"

# 0. Reset
kubectl delete ns $AUTOMATION_NS $now

# 1. Create ns
kubectl create ns $AUTOMATION_NS

# 2. Create rundeck deploy
kubectl apply -f $RUNDECK_DEPLOY

# 3. Create rundeck service
kubectl apply -f $RUNDECK_DEPLOY

# 4. Show everything
kubectl -n $AUTOMATION_NS get all --show-labels
