# With deploy

> demo-2 namespace

1. Create cluster role binding: `k apply -f crb.yaml`
2. Create task: `k apply -f kubectl-deploy-task.yaml`
3. Create pipeline: `k apply -f demo-2-pipeline-with-deploy.yaml`
4. Create pipeline run: `k apply -f demo-2-pipeline-with-deploy-run.yaml`
5. Check deployments: `k get deployments`
