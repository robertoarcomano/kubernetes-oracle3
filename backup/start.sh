#!/bin/bash

# C. Constants
NS=backup
CRONJOB_FILE="cronjob.yaml"
SECRET=rclone-secret
RCLONE_PATH=/home/berto/.config/rclone/rclone.conf
now="--grace-period=0 --force"

# 0. Reset
kubectl delete ns $NS $now

# 1. Create ns
kubectl create ns $NS

# 2. Create secret
kubectl -n $NS create secret generic $SECRET --from-file=$RCLONE_PATH

# 3. Create deploy jenkins
kubectl replace -f $CRONJOB_FILE --force

# 4. Show everything
kubectl -n $NS get all --show-labels
