# Deploy EKS Cluster using ACK from CNOE Backstage

Start devpod using this git repository

Update the IAM Role for the devpod2 EC2 instance to have Administrator access this allows to be able to use Crossplane or ACK without hardcode secrets

### Setup
Clone this repository
```sh
git clone https://github.com/cnoe-io/idpbuilder
```

Copy extra Backstage templates for ACK, rm others
```sh
cp -r examples/ack/backstage-templates/* idpbuilder/examples/ref-implementation/backstage-templates/
rm idpbuilder/examples/ref-implementation/spark-operator.yaml
rm idpbuilder/examples/ref-implementation/argo-workflows.yaml
rm idpbuilder/examples/ref-implementation/crossplane.yaml
rm idpbuilder/examples/ref-implementation/crossplane-providers.yaml
rm idpbuilder/examples/ref-implementation/crossplane-compositions.yaml
```


### Run CNOE on Cloud9
```sh
idpbuilder create \
  --use-path-routing \
  --package-dir idpbuilder/examples/ref-implementation \
  --package-dir examples/ack/aws-controllers-k8s
```

#### Accessing UIs
- Argo CD: https://cnoe.localtest.me:8443/argocd
- Argo Workflows: https://cnoe.localtest.me:8443/argo-workflows
- Backstage: https://cnoe.localtest.me:8443/
- Gitea: https://cnoe.localtest.me:8443/gitea
- Keycloak: https://cnoe.localtest.me:8443/keycloak/admin/master/console/


# Using it

For this example, we will walk through a few demonstrations. Once applications are ready

Click on the Sign-In button, you will be asked to log into the Keycloak instance. There are two users set up in this
configuration, and their password can be retrieved with the following command:

```bash
idpbuilder get secrets
```

As described in the main readme file, the above command is equivalent to running:
```bash
kubectl -n argocd get secret argocd-initial-admin-secret
kubectl get secrets -n gitea gitea-admin-secret
kubectl get secrets -A -l cnoe.io/cli-secret=true
```

Use the username **`user1`** and the password value given by `USER_PASSWORD` field to login to the backstage instance.
`user1` is an admin user who has access to everything in the cluster, while `user2` is a regular user with limited access.
Both users use the same password retrieved above.

## Demo
- Login into Backstage with `user1`
- Go to Create in the menu
- Select the EKS Cluster creation
- Give the name `my-cluster`
- Create namespace `my-cluster` (This is a bug in argocd backstage that doesn't create namespace)
    ```sh
    kubectl create ns my-cluster
    ```


## Remove EKS Clusters

Delete the ArgoCD App with cascading, wait for EKS Cluster to be remove. You can do this from ArgoCD UI

## Remove EKS Clusters

Delete the ArgoCD App with cascading, wait for EKS Cluster to be remove. You can do this from ArgoCD UI also
```sh
kubectl delete app my-cluster -n argocd
```
