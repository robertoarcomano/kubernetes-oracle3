#!/bin/bash

# C. Constants
NS=backup-ns.yaml
CRONJOB_FILE="cronjob.yaml"
KUBECTL="microk8s kubectl"

$KUBECTL apply -f $NS
$KUBECTL apply -f $CRONJOB_FILE

