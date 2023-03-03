#!/bin/bash

# C. Constants
TOOLS_NS_FILE=tools-ns.yaml
METABASE_DEPLOY_FILE=metabase-deploy.yaml
METABASE_SERVICE_FILE=metabase-service.yaml

# 1. Apply all resources
kubectl apply -f $TOOLS_NS_FILE
kubectl apply -f $METABASE_DEPLOY_FILE
kubectl apply -f $METABASE_SERVICE_FILE
