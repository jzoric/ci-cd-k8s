# TRIGGERS
 
Using the demo-2 namespace.
* Switch to demo-2 ns: `kubens demo-2`
* Install triggers: `k apply -f triggers-install.yaml`
* Create admin role: `k apply -f admin-role.yaml`. This service account will use `secrets: regcred` that we created earlier.
* Install trigger template: `k apply -f demo-2-trigger-template.yaml`
* Install trigger binding: `k apply -f demo-2-trigger-binding.yaml`
* Install event listener: `k apply -f demo-2-event-listener.yaml`


## Ingress setup

1. `k apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud/deploy.yaml`
2. Find: `k get el` and add demo-2-event-listener configuration generatedName in `ingress.yaml` 
3. Install ingress: `k apply -f ingress.yaml`
4. Get ingress IP and create: `k get ingress`
5. Create a webhook in github repo **application-json** with IP from above. 


## Logs of the listener:

> k logs -f el-demo-2-event-listener-...

