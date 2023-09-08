#!/bin/bash

# C. Constants
NS=monitoring
NOW="--grace-period=0 --force"
PROMETHEUS_DIR="\/var\/lib\/pv\/prometheus"
GRAFANA_DIR="\/var\/lib\/pv\/grafana"
KUBECTL="microk8s kubectl"
sed -ri "s/path: .*/path: $PROMETHEUS_DIR/" prometheus-deployment.yaml
sed -ri "s/path: .*/path: $GRAFANA_DIR/" grafana-deployment.yaml

# 0. Re-create namespace
$KUBECTL delete ns $NS $NOW
$KUBECTL create ns $NS

# 1. Load cluster role as well as cluster role binding
$KUBECTL replace -f clusterRole.yaml --force

# 2. Load config map
$KUBECTL replace -f config-map.yaml --force

# 3. Load deployment
$KUBECTL replace -f prometheus-deployment.yaml --force

# 4. Load server
$KUBECTL replace -f prometheus-service.yaml --force

# 5. Load ingress
# $KUBECTL replace -f prometheus-ingress.yaml --force

# 6. Grafana datasource
$KUBECTL replace -f grafana-datasource-config.yaml --force

# 7. Grafana deployment
$KUBECTL replace -f grafana-deployment.yaml --force

# 8. Grafana service
$KUBECTL replace -f grafana-service.yaml --force

# 9. Node exporter daemonsets
$KUBECTL replace -f node-exporter-daemonsets.yaml --force

# 10. Node exporter service
$KUBECTL replace -f node-exporter-service.yaml --force

# 11. Show everything
$KUBECTL get all -n $NS
echo

# 12. Prometheus link
IP=$($KUBECTL get node -o jsonpath="{.items[0].status.addresses[*].address}"|tr " " "\n"|grep -E '[0-9]+.[0-9]+.[0-9]+.[0-9]+')
echo "Go to link: http://$IP:30000"

# 13. Grafana link
echo "Go to link: http://$IP:32000"

