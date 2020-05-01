# Demo 2

## Create a secret 

> To be able to access the gcr registry we need to have a secret and a serviceaccount

1. create a demo-2 namespace: `k apply -f demo-2-ns.yaml`
2. switch to demo-2 ns (useful tools: kubectx and kubens). `kubens demo-2`
3. `k create -n demo-2 secret docker-registry regcred  --docker-server=gcr.io --docker-username=_json_key --docker-password="$(cat ../installation/jovica-gcp-be725d9b931f.json)" --docker-email=<your-email>`
4. run the demo-2-sa.yaml: `k apply -f demo-2-sa.yaml`


## Deploy resources

1. Deploy git resource: `k apply -f demo-2-git-resource.yaml`
2. Deploy image resource: `k apply -f demo-2-image-resource.yaml`
3. Deploy task: `k apply -f demo-2-task.yaml`
4. Deploy pipeline: `k apply -f demo-2-pipeline.yaml`
5. Deploy pipeline-run resource: `k apply -f demo-2-pipeline-run.yaml`

> Check the logs and GCR

## Run K8S deployment

1. Run: `k apply -f k8s/demo-2-deployment.yaml`
