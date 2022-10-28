#!/bin/bash

NS=elastic-system
SERVICE=elastic-webhook-server

# 1. Load Elasticsearch Custom Resource Definitions
kubectl create -f https://download.elastic.co/downloads/eck/2.4.0/crds.yaml

# 2. Load Elastisearch operator
kubectl apply -f https://download.elastic.co/downloads/eck/2.4.0/operator.yaml

# 3. Update service type to NodePort
kubectl -n $NS get svc/$SERVICE -o yaml|

