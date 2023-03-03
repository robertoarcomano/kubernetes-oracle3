#!/bin/bash

# C. Constants
MONITORING_NS=monitoring-ns.yaml
CLUSTER_ROLE=clusterRole.yaml
GRAFANA_DATASOURCE_CONFIG=grafana-datasource-config.yaml
GRAFANA_DEPLOY=grafana-deployment.yaml
GRAFANA_SERVICE=grafana-service.yaml
NODE_EXPORTER_DAEMONSET=node-exporter-daemonsets.yaml
NODE_EXPORTER_SERVICE=node-exporter-service.yaml
PROMETHEUS_DEPLOY=prometheus-deployment.yaml
PROMETHEUS_INGRESS=prometheus-ingress.yaml
PROMETHEUS_SERVICE=prometheus-service.yaml

kubectl apply -f $MONITORING_NS
kubectl apply -f $CLUSTER_ROLE
kubectl apply -f $GRAFANA_DATASOURCE_CONFIG
kubectl apply -f $GRAFANA_DEPLOY
kubectl apply -f $GRAFANA_SERVICE
kubectl apply -f $NODE_EXPORTER_DAEMONSET
kubectl apply -f $NODE_EXPORTER_SERVICE
kubectl apply -f $PROMETHEUS_DEPLOY
#kubectl apply -f $PROMETHEUS_INGRESS
kubectl apply -f $PROMETHEUS_SERVICE

