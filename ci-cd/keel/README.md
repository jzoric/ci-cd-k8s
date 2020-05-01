# Keel

## Create a service account

Keel uses pub-sub for communication with GCR. To be able to do this, create a service account (e.g keel-pub-sub) and
set the roles:
* Pub/Sub Editor
* Storage Admin

Create a key and put in in `ci-cd/keel` directory (e.g `ci-cd/keel/my-gcp-3333.json`)

## Install
1. Install keel: `k apply -f keel-install.yaml`
2. Create a k8s secret for pub-sub: `kubectl create -n keel secret generic pubsub-key --from-file=google-application-credentials.json=jovica-gcp-4c054a6e5983.json`
3. Run deployment: `kubectl apply -f keel-deployment.yaml`
4. Check the dashboard: `k get svc -n keel` => <IP>:9300


## Our app

1. Deploy: `k apply -f keel-demo-2-deployment.yaml`
2. Change the source code and push
3. Check via port-forward: `k port-forward svc/keel-demo-2-service 8085:8080`
