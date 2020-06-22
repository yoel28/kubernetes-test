#!/bin/bash
export AWS_PROFILE=adminCli
export KUBE_EDITOR="nano"
eksctl create cluster -f eks-dev.cluster.yaml

#eksctl delete nodegroup -f eks-dev.cluster.yaml --exclude=ng-bs --approve
#eksctl create nodegroup -f eks-dev.cluster.yaml --include=ng-ux
#eksctl scale nodegroup --cluster=eks-dev --name=ng-ux --nodes=1

#kubectl get pods -n kube-system
#kubectl -n kube-system logs -f deployment.apps/cluster-autoscaler