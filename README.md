# CI-CD with tekton pipelines and keel on GKE

Example how to use tekton pipelines and keel to do the ci-cd on kubernetes (GKE)

## Cluster creation using terraform

Below are the steps how to do it by using the terraform. You can create your GKE cluster manually!

### Prerequisits 

* terraform

On Mac the fastest way to do it is by using: https://warrensbox.github.io/terraform-switcher/ 

### Service account
Create a service account (e.g my-terraform-gcp) with:

* Editor
* Storage Admin

role and create a key which you will put in `cluster/creds` folder (e.g `cluster/creds/my-gcp-1111.json`)

### Run

* Run `terraform init` from `cluster` directory
* Run `terraform plan` to check you resources
* Run `terraform apply` to apply the changes 


## Configure kubectl for other steps

> gcloud container clusters get-credentials <project-name>-cluster --region europe-west4 --project <project-name>

## Setup tekton pipelines

Look at README file in `ci-cd/tekton` directory.

## Setup keel

Look at README file in `ci-cd/keel` directory.

# CLEANUP

* Delete keel namespace: `kubectl delete ns keel`
* Delete the cluster: `terraform destroy` from `cluster` directory
* Delete the IAM and service accounts from GCP
* Delete the storage bucket `artifatct...`
