#!/bin/bash

# C. Constants
NS=bookstack
DEPLOY_WEB=deploy_web.yaml
DEPLOY_DB=deploy_db.yaml
SERVICE_WEB=service_web.yaml
SERVICE_DB=service_db.yaml
now="--grace-period=0 --force"

# 0. Reset
kubectl delete ns $NS $now

# 1. Create ns
kubectl create ns $NS

# 2. Create deploy db
kubectl create -f $DEPLOY_DB

# 3. Create service db
kubectl create -f $SERVICE_DB

# 4. Create deploy web
kubectl create -f $DEPLOY_WEB

# 5. Create service web
kubectl create -f $SERVICE_WEB

# 6. Show everything
kubectl -n $NS get all --show-labels
