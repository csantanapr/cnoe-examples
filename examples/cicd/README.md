# CICD Stack

Using Backstage, Argo Workflows, Argo Events, and Argo CD to deploy application to Kubernetes

The example create two git repositories one for the application and continues integration and the other for the continues delivery

If running on Linux (ie EC2), you might need to run this:
```bash
# kernel configurations
sudo sysctl fs.inotify.max_user_instances=1280
sudo sysctl fs.inotify.max_user_watches=655360
```

Create Environment
```bash
idpbuilder create -p . --use-path-routing
```

Wait until all Argo CD Apps are Synced and Healthy (This takes about 5 minutes)
Use helper script:
```bash
./monitor-argocd-apps.sh keycloak backstage argo-workflows
```

Check status
```bash
kubectl get applications -n argocd
```

Expected output:
```
NAME                  SYNC STATUS   HEALTH STATUS
argo-events           Synced        Healthy
argo-workflows        Synced        Healthy
argocd                Synced        Healthy
backstage             Synced        Healthy
backstage-templates   Synced        Healthy
external-secrets      Synced        Healthy
gitea                 Synced        Healthy
keycloak              Synced        Healthy
metric-server         Synced        Healthy
nginx                 Synced        Healthy
shared-helm-charts    Synced        Healthy
```

Open URL https://cnoe.localtest.me:8443/argocd


Use helper script to get URLs and Credentials
```bash
./get-credentials.sh credentials.txt
```

