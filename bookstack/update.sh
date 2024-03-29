#!/bin/bash

# C. Constants
BOOKSTACK_NS=bookstack-ns.yaml
DEPLOY_DB=deploy_db.yaml
SERVICE_DB=service_db.yaml
DEPLOY_WEB=deploy_web.yaml
SERVICE_WEB=service_web.yaml

kubectl apply -f $BOOKSTACK_NS
kubectl apply -f $DEPLOY_DB
kubectl apply -f $SERVICE_DB
kubectl apply -f $DEPLOY_WEB
kubectl apply -f $SERVICE_WEB
