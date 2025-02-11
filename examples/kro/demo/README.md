# kro WebApp example

This example creates a ResourceGraphDefinition called `WebApp` and then instantiates it with
the default nginx container image.

### Create ResourceGraphDefinition called WebApp

Apply the RGD to your cluster:

```shell
kubectl apply -f rg.yaml
```

Validate the RGD status is Active:

```shell
kubectl get rgd webapp -o wide
```

Expected result:

```shell
NAME             APIVERSION   KIND          STATE    TOPOLOGICALORDER                     AGE
my-application   v1alpha1     Application   Active   ["deployment","service","ingress"]   29s
```

### Create an Instance of kind Application

Apply the provided instance.yaml

```shell
kubectl apply -f instance.yaml
```

Validate instance status:

```shell
kubectl get application my-application-instance
```

Expected result:

```shell
NAME       STATE    SYNCED   AGE
test-app   ACTIVE   True     16m
```

### Validate the app is working

Get the ingress url:

```shell
kubectl get ingress test-app -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

Either navigate in the browser or curl it:

```shell
curl -s $(kubectl get ingress test-app -o jsonpath='{.status.loadBalancer.ingress[0].hostname}') | sed -n '/<body>/,/<\/body>/p' | sed -e 's/<[^>]*>//g'
```

Expected result:

```
Welcome to nginx!
If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.

For online documentation and support please refer to
nginx.org.
Commercial support is available at
nginx.com.

Thank you for using nginx.
```

### Clean up

Remove the instance:

```shell
kubectl delete webapps test-app
```

Remove the resourcegraphdefinition:

```shell
kubectl delete rgd webapp.kro.run
```
