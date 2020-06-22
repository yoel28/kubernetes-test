#!/bin/bash
export AWS_PROFILE=adminCli
export KUBE_EDITOR="nano"
eksctl create cluster -f eks-dev.cluster.yaml

### configure scale node
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml
#kubectl -n kube-system annotate deployment.apps/cluster-autoscaler cluster-autoscaler.kubernetes.io/safe-to-evict="false"
#kubectl -n kube-system edit deployment.apps/cluster-autoscaler
#kubectl -n kube-system set image deployment.apps/cluster-autoscaler cluster-autoscaler=us.gcr.io/k8s-artifacts-prod/autoscaling/cluster-autoscaler:v1.16.5
#kubectl -n kube-system get pods
#kubectl -n kube-system logs -f deployment.apps/cluster-autoscaler

#### commands
#eksctl delete nodegroup -f eks-dev.cluster.yaml --exclude=ng-bs --approve
#eksctl create nodegroup -f eks-dev.cluster.yaml --include=ng-ux
#eksctl scale nodegroup --cluster=eks-dev --name=ng-ux --nodes=1

#kubectl scale --replicas=15 deployment wp01
#kubectl get pods -n kube-system

### configure hpa
#kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml
#kubectl get deployment metrics-server -n kube-system
#kubectl describe hpa
