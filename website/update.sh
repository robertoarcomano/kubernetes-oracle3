#!/bin/bash

# C. Constants
NS_FILE=website-ns.yaml
DB_DEPLOY_FILE=website-db-deploy.yaml
DB_SERVICE_FILE=website-db-service.yaml
WEB_DEPLOY_FILE=website-web-deploy.yaml
WEB_SERVICE_FILE=website-web-service.yaml

# 1. apply all resources
kubectl apply -f $NS_FILE
kubectl apply -f $DB_DEPLOY_FILE
kubectl apply -f $DB_SERVICE_FILE
kubectl apply -f $WEB_DEPLOY_FILE
kubectl apply -f $WEB_SERVICE_FILE

