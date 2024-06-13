# Kubernetes local dev lifecycle loop

### Container Runtimes on AWS
- EC2
- AppRunner
- Lambda
- ECS
- EKS

### Images
Dockerfile
Language
- chainguard https://edu.chainguard.dev/chainguard/chainguard-images/reference/node/

### Local Container
- Docker
- Finch
- ContainerD
- Podman
- NerdCTL


### Finch
https://github.com/runfinch/finch
https://runfinch.com/
https://runfinch.com/docs/container-images/authentication/#amazon-ecr
export KIND_EXPERIMENTAL_PROVIDER=finch

## AWS
- [aws-vault](https://github.com/99designs/aws-vault)
docker run -it --rm --entrypoint bash public.ecr.aws/aws-cli/aws-cli


### ECR
aws sts get-caller-identity
https://github.com/awslabs/amazon-ecr-credential-helper
How to authenticate to push and pull images?


### Local Kubernetes
- kubectl
- kubens
- kubectx
- minikube
- kind
- docker-desktop kubernetes


### Kind
export KIND_EXPERIMENTAL_PROVIDER=finch
kind create cluster
kind load docker-image
docker exec -it control-plane bash
crictl images

### Deploy
kubectl create deployment
kubectl expose deployment
kubectl port-forward


### GitOps
- fluxcd
- argocd

### ArgoCD
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd --create-namespace --namespace argocd
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode ; echo
kubectl port-forward svc/argocd-server -n argocd 8080:443


### CNOE
https://cnoe.io/
https://github.com/cnoe-io/idpbuilder
kubectl get ingress -A

docker login into gitea

### AWS
- [aws-vault](https://github.com/99designs/aws-vault)
- [eksdemo](https://github.com/awslabs/eksdemo)
- [gitops-bridge-dev](https://github.com/gitops-bridge-dev)
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-docker.html


ArgoCD Cluster Secret
https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#eks
aws eks describe-cluster --name eksdemo

https://docs.localstack.cloud/user-guide/aws/feature-coverage/


```
	"credHelpers": {
		"015299085168.dkr.ecr.us-east-1.amazonaws.com": "ecr-login",
		"015299085168.dkr.ecr.us-west-2.amazonaws.com": "ecr-login",
		"public.ecr.aws": "ecr-login"
	},
```