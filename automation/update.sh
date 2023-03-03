#!/bin/bash

# C. Constants
AUTOMATION_NS=automation-ns.yaml
RUNDECK_DEPLOY=rundeck-deploy.yaml
RUNDECK_SERVICE=rundeck-service.yaml

kubectl apply -f $AUTOMATION_NS
kubectl apply -f $RUNDECK_DEPLOY
kubectl apply -f $RUNDECK_SERVICE

