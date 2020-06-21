#!/bin/bash

export namespace='wordpress01'

kubectl config set-context --current --namespace=$namespace
kubectl config view | grep namespace:

kubectl delete -f wordpress.deployment.yaml --namespace=$namespace
kubectl delete -f wordpress.service.yaml --namespace=$namespace

kubectl delete -f mysql.deployment.yaml --namespace=$namespace
kubectl delete -f mysql.service.yaml --namespace=$namespace

kubectl delete secret wp01.mysql.secret --namespace=$namespace

kubectl delete -f mysql.pvc.yaml --namespace=$namespace
kubectl delete -f wordpress.pvc.yaml --namespace=$namespace
kubectl delete -f cache.pvc.yaml --namespace=$namespace

kubectl delete -f namespace.yaml
