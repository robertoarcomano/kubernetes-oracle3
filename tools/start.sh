#!/bin/bash

# C. Constants
NS=tools
NOW="--grace-period=0 --force"

METABASE_DEPLOY_FILE=metabase-deploy.yaml
METABASE_SERVICE_FILE=metabase-service.yaml

# 0. Re-create namespace
kubectl delete ns $NS $NOW
kubectl create ns $NS

# 1. Create all resources
kubectl create -f $METABASE_DEPLOY_FILE
kubectl create -f $METABASE_SERVICE_FILE

# 2. Show everything
kubectl get all -n $NS
echo
