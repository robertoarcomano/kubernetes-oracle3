#!/bin/bash

# C. Constants
NS=devops
JENKINS_DEPLOY_FILE=jenkins-deploy.yaml
JENKINS_POD=""
JENKINS_SVC_FILE=jenkins-svc.yaml
PASSWORD_FILE=/var/jenkins_home/secrets/initialAdminPassword
KUBECTL="microk8s kubectl"
now="--grace-period=0 --force"

# 0. Reset
$KUBECTL delete ns $NS $now

# 1. Create ns
$KUBECTL create ns $NS

# 2. Create deploy jenkins
$KUBECTL replace -f $JENKINS_DEPLOY_FILE --force

# 3. Create service jenkins
$KUBECTL replace -f $JENKINS_SVC_FILE --force

# 4. Create secret
$KUBECTL create -n $NS secret generic gitlab-registry-auth \
  --from-file=.dockerconfigjson=$HOME/.docker/config.json \
  --type=kubernetes.io/dockerconfigjson

# 5. Wait until pod is ready
JENKINS_POD=$($KUBECTL -n $NS get pod --no-headers | grep -i jenkins | awk '{print $1}')
echo "JENKINS_POD: " $JENKINS_POD
until $KUBECTL -n $NS get pod $JENKINS_POD|grep Running; do sleep 1; done
until $KUBECTL -n $NS logs $JENKINS_POD |grep "Jenkins is fully up and running"; do sleep 1; done

# 6. Show password
echo -e "Jenkins password: "
$KUBECTL -n $NS exec -it $JENKINS_POD -- cat $PASSWORD_FILE
