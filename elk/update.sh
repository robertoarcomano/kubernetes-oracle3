#!/bin/bash

# 0. Constants
ELASTICSEARCH_NS=elasticsearch-ns.yaml
ELASTICSEARCH_DEPLOY_FILE=elasticsearch-deploy.yaml
ELASTICSEARCH_SERVICE_FILE=elasticsearch-service.yaml
KIBANA_DEPLOY_FILE=kibana-deploy.yaml
KIBANA_SERVICE_FILE=kibana-service.yaml

kubectl apply -f $ELASTICSEARCH_NS
kubectl apply -f $ELASTICSEARCH_DEPLOY_FILE
kubectl apply -f $ELASTICSEARCH_SERVICE_FILE
kubectl apply -f $KIBANA_DEPLOY_FILE
kubectl apply -f $KIBANA_SERVICE_FILE

