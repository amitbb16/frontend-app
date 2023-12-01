#!/bin/bash

nohup kubectl port-forward services/$(kubectl get services | grep grafana | awk '{print$1}') 3000:80 

nohup kubectl port-forward services/$(kubectl get services | grep prometheus-operated | awk '{print$1}') 9090:9090

helm install mysqldb prometheus-community/prometheus-mysql-exporter --set user="exporter" --set pass="password"