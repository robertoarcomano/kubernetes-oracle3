#!/bin/bash

# 0. Constants
NS=elk
NOW="--grace-period=0 --force"
ELASTICSEARCH_DEPLOY_FILE=elasticsearch-deploy.yaml
ELASTICSEARCH_SERVICE_FILE=elasticsearch-service.yaml
KIBANA_DEPLOY_FILE=kibana-deploy.yaml
KIBANA_SERVICE_FILE=kibana-service.yaml
STARTUP_TIME=60

# 1. Create the namespace
kubectl delete ns $NS $NOW
kubectl create ns $NS

# 2. Create deploys as well as services
kubectl apply -f $ELASTICSEARCH_DEPLOY_FILE
kubectl apply -f $ELASTICSEARCH_SERVICE_FILE
kubectl apply -f $KIBANA_DEPLOY_FILE
kubectl apply -f $KIBANA_SERVICE_FILE

# 4. Get security data from elasticsearch
# 4.1. Wait for the elasticsearch pod
# until kubectl -n $NS get pod --no-headers | grep elasticsearch | grep Running; do sleep 1; done
# # 4.2. Get pod name
# POD=$(kubectl -n $NS get pod --no-headers | grep elasticsearch | grep Running|awk '{print $1}')
# # 4.3. Wait for $STARTUP_TIME seconds
# sleep $STARTUP_TIME
# # 4.4. Create and get elastic password as well as kibana token
# PASSWORD=$(kubectl -n $NS exec -it $POD -- sh -c "/usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic -b"|grep "New value"|awk '{print $NF}')
# TOKEN=$(kubectl -n $NS exec -it $POD -- sh -c "/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana")
# echo "$PASSWORD"
# echo "$TOKEN"

