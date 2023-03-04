#!/bin/bash

# C. Constants
DATABASE_NS=database-ns.yaml
MYSQL_DEPLOY=mysql-deploy.yaml
MYSQL_SERVICE=mysql-service.yaml
now="--grace-period=0 --force"

# 0. Reset
kubectl delete ns $DATABASE_NS $now

# 1. Create ns
kubectl create ns $DATABASE_NS

# 2. Create rundeck deploy
kubectl apply -f $MYSQL_DEPLOY

# 3. Create rundeck service
kubectl apply -f $MYSQL_SERVICE

# 4. Show everything
kubectl -n $DATABASE_NS get all --show-labels
