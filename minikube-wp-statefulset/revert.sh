#!/bin/bash

export namespace='wordpress02'

kubectl config set-context --current --namespace=$namespace
kubectl config view | grep namespace:

kubectl delete -f wp02.deployment.yaml --namespace=$namespace
kubectl delete -f wp02.service.yaml --namespace=$namespace

kubectl delete -f mysql.deployment.yaml --namespace=$namespace
kubectl delete -f mysql.service.yaml --namespace=$namespace

kubectl delete secret wp02.mysql.secret --namespace=$namespace

kubectl delete -f mysql.pvc.yaml --namespace=$namespace

kubectl delete -f wp02.storageclass.yaml --namespace=$namespace

kubectl delete -f namespace.yaml