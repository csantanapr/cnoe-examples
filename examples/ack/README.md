# Deploy EKS Cluster using ACK from CNOE Backstage

### Cloud Formation for Cloud 9 Env
Create Cloud9 Environment using cloud formation template [cloud9-dynamic-template.yaml](../../hack/cfn/cloud9-dynamic-template.yaml)

### Setup hostname

Update hostname in files
```sh
cd idpbuilder/examples/ref-implementation
./replace.sh $C9_PID.vfs.cloud9.$AWS_REGION.amazonaws.com 443
cd -
```


### Run CNOE on Cloud9
```sh
idpbuilder create \
  --use-path-routing \
  --protocol http  \
  --host $C9_PID.vfs.cloud9.$AWS_REGION.amazonaws.com \
  --port 8080 \
  --package-dir idpbuilder/examples/ref-implementation \
  --package-dir cnoe-examples/examples/ack/aws-controllers-k8s
```

#### Accessing UIs
Get the UIs printed in terminal with the following command
```shell
echo -n "- Backstage: https://$C9_PID.vfs.cloud9.$AWS_REGION.amazonaws.com
- Argo CD: https://$C9_PID.vfs.cloud9.$AWS_REGION.amazonaws.com/argocd
- Argo Workflows: https://$C9_PID.vfs.cloud9.$AWS_REGION.amazonaws.com/argo-workflows
- Gitea: https://$C9_PID.vfs.cloud9.$AWS_REGION.amazonaws.com/gitea
- Keycloak: https://$C9_PID.vfs.cloud9.$AWS_REGION.amazonaws.com/keycloak/admin/master/console
"
```

Takes about 5 minutes for eveything to be up, you can check in ArgoCD and see if all the apps are sync/green

# Accessing Backstage

For this example, we will walk through a few demonstrations. Once applications are ready

Click on the Sign-In button, you will be asked to log into the Keycloak instance. There are two users set up in this
configuration, and their password can be retrieved with the following command:

```bash
idpbuilder get secrets
```

Use the username **`user1`** and the password value given by `USER_PASSWORD` field to login to the backstage instance.
`user1` is an admin user who has access to everything in the cluster, while `user2` is a regular user with limited access.
Both users use the same password retrieved above.


## Demo
- Login into Backstage with `user1`
- Go to Create in the menu
- Select the EKS Cluster creation
- Give the name `my-cluster`
- Create namespace `my-cluster` with `kubectl create ns my-cluster` (This is a bug in argocd backstage that doesn't create namespace)


## Remove EKS Clusters

Delete the ArgoCD App with cascading, wait for EKS Cluster to be remove. You can do this from ArgoCD UI