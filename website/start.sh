#!/bin/bash

# C. Constants
NS=website
NOW="--grace-period=0 --force"
DB_DEPLOY_FILE=website-db-deploy.yaml
DB_SERVICE_FILE=website-db-service.yaml
WEB_DEPLOY_FILE=website-web-deploy.yaml
WEB_SERVICE_FILE=website-web-service.yaml
KUBECTL="microk8s kubectl"

# 0. Re-create namespace
$KUBECTL delete ns $NS $NOW
$KUBECTL create ns $NS

# 1. Create all resources
$KUBECTL create -f $DB_DEPLOY_FILE
$KUBECTL create -f $DB_SERVICE_FILE
$KUBECTL create -f $WEB_DEPLOY_FILE
$KUBECTL create -f $WEB_SERVICE_FILE

# 2. Show everything
$KUBECTL get all -n $NS
echo
