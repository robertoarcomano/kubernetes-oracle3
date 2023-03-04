#!/bin/bash

# C. Constants
DATABASE_NS=database-ns.yaml
RUNDECK_DEPLOY=rundeck-deploy.yaml
RUNDECK_SERVICE=rundeck-service.yaml

kubectl apply -f $DATABASE_NS
kubectl apply -f $RUNDECK_DEPLOY
kubectl apply -f $RUNDECK_SERVICE

