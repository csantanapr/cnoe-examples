# Kro demo

idpbuilder create --use-path-routing -p examples/kro/kro-controller -p examples/ack/aws-controllers-k8s/


# When running in kind from docker using devpod need to allow IMDS 4 hops
```bash
export INSTANCE_ID=$(TOKEN=`curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -s -H "X-aws-ec2-metadata-token: $TOKEN"  http://169.254.169.254/latest/meta-data/instance-id)
aws ec2 modify-instance-metadata-options --instance-id $INSTANCE_ID --http-put-response-hop-limit 4 --http-endpoint enabled --region $AWS_REGION
```


# setup remote cluster
CLUSTER_NAME="testcluster32"
KUBECONFIG_FILE=/tmp/kubeconfig
aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME --kubeconfig $KUBECONFIG_FILE
KUBECONFIG=$(kubectl config --kubeconfig $KUBECONFIG_FILE view --raw -o json)
SERVER_URL=$(echo $KUBECONFIG | jq -r '.clusters[0].cluster.server')
CA_DATA=$(echo $KUBECONFIG | jq -r '.clusters[0].cluster."certificate-authority-data"')

cat << EOF > /tmp/argocd-cluster-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: $CLUSTER_NAME
  namespace: argocd
  labels:
    argocd.argoproj.io/secret-type: cluster
type: Opaque
stringData:
  name: $CLUSTER_NAME
  server: $SERVER_URL
  clusterResources: "true"
  config: |
    {
      "execProviderConfig": {
        "command": "argocd-k8s-auth",
        "args": ["aws", "--cluster-name", "$CLUSTER_NAME"],
        "apiVersion": "client.authentication.k8s.io/v1beta1"
      },
      "tlsClientConfig": {
        "insecure": false,
        "caData": "$CA_DATA"
      }
    }
EOF

