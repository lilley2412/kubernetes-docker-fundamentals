#!/bin/bash

set -e 

cat <<EOF | kind create cluster --name kind --config -
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 9090
    protocol: TCP
  - containerPort: 443
    hostPort: 9443
    protocol: TCP
  - containerPort: 30100
    hostPort: 30100
  - containerPort: 30101
    hostPort: 30101
  - containerPort: 30102
    hostPort: 30102
  - containerPort: 30103
    hostPort: 30103
  - containerPort: 30104
    hostPort: 30104
  - containerPort: 30105
    hostPort: 30105
- role: worker
- role: worker
EOF

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

