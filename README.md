# CNOE.io Examples

Examples to showcase use cases for Internal Developer Platform on top of Kubernetes

## Using DevPod
- Install and open DevPod
- Setup a Cloud Provider (ie. AWS)
- Open Workspace at https://github.com/csantanapr/cnoe-examples, select a cloud provider VM and Visual Studio Desktop as IDE

## Using Github Codespaces
- From github repository select open with CodeSpaces
- After CodeSpaces is up select from menu Open in Visual Studio Desktop

## Port Forwarding
- In Visual Studio Code on the Desktop open the "PORTS" tab, then add a new forward rule for port `8443` to `127.0.0.1:8443` this will make a tunnel using ssh from Visual Studio Code on Desktop to the remote Linux VM.


## Running an example

In the terminal run `idpbuilder` pointing to a directory with the example.

### basic/package1
```shell
idbbuilder create -p idpbuilder/examples/basic/package1
```
### basic/package2
```shell
idbbuilder create -p idpbuilder/examples/basic/package2
```
### basic/package1
```shell
idbbuilder create -p idpbuilder/examples/ref-implementattion
```




## Accessing UIs
ArgoCD and Gitea are always installed by default, the others UIs will depend on the example selected.
- Argo CD: https://argocd.cnoe.localtest.me:8443
- Gitea: https://gitea.cnoe.localtest.me:8443
- Argo Workflows: https://argo.cnoe.localtest.me:8443
- Backstage: https://backstage.cnoe.localtest.me:8443
- Keycloak: https://keycloak.cnoe.localtest.me:8443/admin/master/console/

