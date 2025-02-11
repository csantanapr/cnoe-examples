Webstack

```shell
kubectl apply -f rgds/
```

```shell
kubectl get rgd
```

```shell
kubectl get deployment,pod,svc,sa,ing,buckets,podidentityassociations
```

Check Pod Identity
```shell
kubectl get pod -l app=kro-demo-1234 -o yaml | grep env -A 12
```