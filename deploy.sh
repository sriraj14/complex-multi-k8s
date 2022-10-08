#!/usr/bin/env bash
set -ex

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=sriraj14/multi-server:$SHA
kubectl set image deployments/client-deployment server=sriraj14/multi-client:$SHA
kubectl set image deployments/worker-deployment server=sriraj14/multi-worker:$SHA


