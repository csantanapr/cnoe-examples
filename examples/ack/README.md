# Deploy EKS Cluster using ACK from CNOE Backstage

## Setup

Using AWS region `us-west-2` create a Cloud9 environment using the following Cloud Formation stack [cloud9-dynamic-template.yaml](../../hack/cfn/cloud9-dynamic-template.yaml)

Select "Upload a tempalte file"

Clone this repository
```shell
git clone https://github.com/csantanapr/cnoe-examples.git
``

```bash
idpbuilder create \
  --use-path-routing \
  --package-dir examples/ref-implementation \
  --package-dir cnoe-examples/ack
```

Get the URL from the output Cloud Formation `PreviewAppUrl`

#### Main UI
- Backstage: https://${PreviewAppUrl}/

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

If you want to create a new user or change existing users:

1. Go to the [Keycloak UI](https://${PreviewAppUrl}/keycloak/admin/master/console/).
Login with the username `cnoe-admin`. Password is the `KEYCLOAK_ADMIN_PASSWORD` field from the command above.
2. Select `cnoe` from the realms drop down menu.
3. Select users tab.
