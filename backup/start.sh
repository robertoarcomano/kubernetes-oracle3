#!/bin/bash

# C. Constants
NS=backup
JOB_FILE="job.yaml"
JOB_NAME="backup"
TIMEOUT=10
now="--grace-period=0 --force"

# 0. Reset
kubectl delete ns $NS $now

# 1. Create ns
kubectl create ns $NS

# 2. Create deploy jenkins
kubectl replace -f $JOB_FILE --force

# 3. Get pod name
until kubectl -n $NS get pod -l "job-name=$JOB_NAME"; do sleep 1; done
while kubectl -n $NS get pod -l "job-name=$JOB_NAME"|grep ContainerCreating; do sleep 1; done
POD_NAME=$(kubectl -n $NS get pod -l "job-name=$JOB_NAME" --no-headers|awk '{print $1}')

# 4. Show job log
timeout $TIMEOUT kubectl logs -n $NS "$POD_NAME" -f