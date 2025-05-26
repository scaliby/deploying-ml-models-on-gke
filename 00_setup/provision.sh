#! /bin/sh

#set -e

echo "Enabling container.googleapis.com"
gcloud services enable container.googleapis.com

echo "Creating cluster"
gcloud container clusters create-auto workshop --location=us-central1

echo "Getting credentials for the cluster"
gcloud container clusters get-credentials workshop --location=us-central1

echo "Creating docker repository"
gcloud artifacts repositories create workshop --repository-format=docker --location=us-central1

echo "Configuring docker CLI"
gcloud auth configure-docker us-central1-docker.pkg.dev

PROJECT_NUMBER=$(gcloud config get-value project)
PROJECT_ID=$(gcloud projects describe $PROJECT_NUMBER --format="value(projectNumber)")
echo "Retrieved project id: $PROJECT_ID"

echo "Configuring kubernetes permissions"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$PROJECT_ID-compute@developer.gserviceaccount.com" \
    --role=roles/artifactregistry.reader
