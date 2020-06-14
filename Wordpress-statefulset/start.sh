#!/bin/bash
export cluster='Cluster01'

export namespace='wordpress02'

kubectl apply -f namespace.yaml

kubectl config set-context --current --namespace=$namespace
kubectl config view | grep namespace:

kubectl apply -f wp02.storageclass.yaml --namespace=$namespace

kubectl get storageclasses --namespace=$namespace

kubectl patch storageclass standard -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}' -namespace=$namespace

kubectl get storageclasses --namespace=$namespace

kubectl apply -f mysql.pvc.yaml --namespace=$namespace

RANDOM_PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

kubectl create secret generic wp02.mysql.secret --from-literal=password=$RANDOM_PASS --namespace=$namespace

kubectl apply -f mysql.deployment.yaml --namespace=$namespace
kubectl apply -f mysql.service.yaml --namespace=$namespace

kubectl apply -f wp02.deployment.yaml --namespace=$namespace
kubectl apply -f wp02.service.yaml --namespace=$namespace

minikube service list -p $cluster --namespace=$namespace