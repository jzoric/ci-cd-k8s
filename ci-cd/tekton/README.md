# Tekton pipelines

## Login to cluster (kubectl)

> Run: gcloud container clusters get-credentials <cluster_name> --region <region> --project <project>

## Create a service account

We will use a GCR to store our images. To be able to do this create a service account (e.g tekton-gcr) and
set the role `Storage Admin`. Create a key and put in in `ci-cd/tekton/installation` directory (e.g `ci-cd/tekton/installation/my-gcp-2222.json`)

## Install Tekton

1. Create cluster role binding: `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value core/account)`
2. Change directory to `ci-cd/tekton/installation` and install tekton: `k apply -f tekton-install.yaml`


## Install Tekton dashboard

1. Change directory to `ci-cd/tekton/installation/dashboard` and install dashboard: `k apply -f tekton-dashboard-release.yaml`

> Access the dashboard: k -n tekton-pipelines port-forward svc/tekton-dashboard 9097:9097


## Install Tekton CLI

1. `brew tap tektoncd/tools`
2. `brew install tektoncd/tools/tektoncd-cli`
