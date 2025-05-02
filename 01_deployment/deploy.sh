#! /bin/sh

set -e

DOCKER_IMAGE=us-central1-docker.pkg.dev/$(gcloud config get-value project)/workshop/rock_paper_scissors:$RANDOM

docker build -t $DOCKER_IMAGE .
docker push $DOCKER_IMAGE

DEPLOYMENT="$(DOCKER_IMAGE=$DOCKER_IMAGE envsubst < kubernetes.yaml)"

echo "$DEPLOYMENT" | kubectl apply -f -
