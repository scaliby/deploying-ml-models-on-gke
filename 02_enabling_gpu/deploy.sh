#! /bin/sh

set -e

DOCKER_IMAGE=$(kubectl get pods --selector=app=rock-paper-scissors-model -o=jsonpath='{.items[0].spec.containers[0].image}')

DEPLOYMENT="$(DOCKER_IMAGE=$DOCKER_IMAGE envsubst < kubernetes.yaml)"

echo "$DEPLOYMENT" | kubectl apply -f -