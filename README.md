# Deploying ML models on GKE

This repository contains everything that is needed for "Deploying ML models on GKE" workshop. It provides necessaary scripts and code samples to ensure smooth experience during workshop.

## Links

- [Create Project](https://console.cloud.google.com/projectcreate)
- [Google Colab](https://colab.research.google.com/github/scaliby/deploying-ml-models-on-gke/blob/main/rock_paper_scissors.ipynb)

## Useful commands
- `git clone https://github.com/scaliby/deploying-ml-models-on-gke.git` - clones the repository
- `./00_setup/provision.sh` - runs projects provisioning
- `./02_deployment/deploy.sh` - builds, pushes, and deploys on GKE
- `kubectl get pods` - lists pods on Kubernetes
- `kubectl get deployment` - lists deployments on Kubernetes
- `kubectl get svc` - lists services (can be used to retrieve LB IP) 
- `kubectl get hpa` - lists HPA's
