#!/bin/bash

export namespace='wordpress01'

kubectl apply -f namespace.yaml

kubectl config set-context --current --namespace=$namespace
kubectl config view | grep namespace:

kubectl apply -f mysql.pvc.yaml --namespace=$namespace
kubectl apply -f wordpress.pvc.yaml --namespace=$namespace
kubectl apply -f cache.pvc.yaml --namespace=$namespace

RANDOM_PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

kubectl create secret generic wp01.mysql.secret --from-literal=password=$RANDOM_PASS --namespace=$namespace

kubectl apply -f mysql.deployment.yaml --namespace=$namespace
kubectl apply -f mysql.service.yaml --namespace=$namespace

kubectl apply -f wordpress.deployment.yaml --namespace=$namespace
kubectl apply -f wordpress.service.yaml --namespace=$namespace