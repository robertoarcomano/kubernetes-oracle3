#!/bin/bash

# C. Constants
NS=backup-ns.yaml
CRONJOB_FILE="cronjob.yaml"

kubectl apply -f $NS
kubectl apply -f $CRONJOB_FILE

