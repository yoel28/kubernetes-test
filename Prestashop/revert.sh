#!/bin/bash

export namespace='prestashop01'

kubectl config set-context --current --namespace=$namespace
kubectl config view | grep namespace:

kubectl delete -f memcached.deployment.yaml --namespace=$namespace
kubectl delete -f memcached.service.yaml --namespace=$namespace

kubectl delete -f prestashop.deployment.yaml --namespace=$namespace
kubectl delete -f prestashop.service.yaml --namespace=$namespace

kubectl delete -f mysql.deployment.yaml --namespace=$namespace
kubectl delete -f mysql.service.yaml --namespace=$namespace

kubectl delete secret ps01.mysql.secret --namespace=$namespace

kubectl delete -f mysql.pvc.yaml --namespace=$namespace
kubectl delete -f system.pvc.yaml --namespace=$namespace

kubectl delete -f ps01.storageclass.yaml --namespace=$namespace

kubectl delete -f namespace.yaml
