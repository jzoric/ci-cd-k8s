# Backend-Frontend pipeline

> Switch to default namespace: `kubens default`


1. `k create secret -n default docker-registry regcred  --docker-server=gcr.io --docker-username=_json_key --docker-password="$(cat ../installation/jovica-gcp-be725d9b931f.json)" --docker-email=<your-email>`
2. run the demo-2-sa.yaml: `k apply -f backend-frontend-sa.yaml`
3. Install git task: `k apply -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/git/git-clone.yaml`
4. Install maven task: `k apply -f maven.yaml` 
5. Create pvc: `k apply -f pvc.yaml`
6. Create backend image resource: `k apply -f backend-image-resource.yaml`
7. Create frontend image resource: `k apply -f frontend-image-resource.yaml`
8. Create backend task: `k apply -f backend-build-push.yaml`
9. Create frontend task: `k apply -f frontend-build-push.yaml`
10. Create pipeline: `k apply -f the-pipeline.yaml`
11. Create pipeline: `k apply -f the-pipeline-run.yaml`
