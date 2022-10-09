#!/bin/bash

# C. Constants
NS=website
NOW="--grace-period=0 --force"
DB_DEPLOY_FILE=website-db-deploy.yaml
DB_SERVICE_FILE=website-db-service.yaml
WEB_DEPLOY_FILE=website-web-deploy.yaml
WEB_SERVICE_FILE=website-web-service.yaml

# 0. Re-create namespace
kubectl delete ns $NS $NOW
kubectl create ns $NS

# 1. Create all resources
kubectl create -f $DB_DEPLOY_FILE
kubectl create -f $DB_SERVICE_FILE
kubectl create -f $WEB_DEPLOY_FILE
kubectl create -f $WEB_SERVICE_FILE

# 2. Show everything
kubectl get all -n $NS
echo
