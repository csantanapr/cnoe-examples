# Deploy EKS Cluster using ACK from CNOE Backstage

## Setup
- Using AWS region `us-west-2` create a Cloud9 environment using the following Cloud Formation stack [cloud9-dynamic-template.yaml](../../hack/cfn/cloud9-dynamic-template.yaml)
- Select "Upload a tempalte file"
- When Stack is complete get the URLs from the Output variables `Cloud9IDE` and `PreviewAppUrl`
- Open Cloud9 using URL

Clone this repository
```shell
git clone https://github.com/csantanapr/cnoe-examples.git
```

Copy extra Backstage templates for ACK
```shell
cp -r cnoe-examples/examples/ack/backstage-templates/* idpbuilder/examples/ref-implementation/backstage-templates/
```

(Optional) Delete not required packages
```shell
rm idpbuilder/examples/ref-implementation/spark-operator.yaml
rm idpbuilder/examples/ref-implementation/crossplane.yaml
rm idpbuilder/examples/ref-implementation/crossplane-providers.yaml
rm idpbuilder/examples/ref-implementation/crossplane-compositions.yaml
rm idpbuilder/examples/ref-implementation/argo-workflows.yaml
```

Replace the hostname, use only the hostname (without https://) from `PreviewAppUrl`
```bash
cd idpbuilder/examples/ref-implementation
./replace.sh ${PreviewAppUrl_HOSTNAME} 443
cd -
```

Run CNOE
```bash
idpbuilder create \
  --use-path-routing \
  --protocol http  \
  --host ${PreviewAppUrl_HOSTNAME} \
  --port 8080 \
  --package-dir idpbuilder/examples/ref-implementation \
  --package-dir cnoe-examples/examples/ack/aws-controllers-k8s
```

#### Main UI
- Backstage: https://${PreviewAppUrl}/
>The ${PreviewAppUrl} can be found in Cloud Formation Output

#### Other UIs
- Argo CD: https://${PreviewAppUrl}/argocd
- Argo Workflows: https://${PreviewAppUrl}/argo-workflows
- Gitea: https://${PreviewAppUrl}/gitea
- Keycloak: https://${PreviewAppUrl}/keycloak/admin/master/console/

> If using Devpod replace `https://${PreviewAppUrl}/` with `https://cnoe.localtest.me:8443/`

# Using it

For this example, we will walk through a few demonstrations. Once applications are ready, go to the [backstage URL](https://${PreviewAppUrl}).

Click on the Sign-In button, you will be asked to log into the Keycloak instance. There are two users set up in this
configuration, and their password can be retrieved with the following command:

```bash
idpbuilder get secrets
```

Use the username **`user1`** and the password value given by `USER_PASSWORD` field to login to the backstage instance.
`user1` is an admin user who has access to everything in the cluster, while `user2` is a regular user with limited access.
Both users use the same password retrieved above.

