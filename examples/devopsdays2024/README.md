# Standardization vs. Autonomy the Platform Engineering Balance

Slides: [Standardization vs. Autonomy the Platform Engineering Balance](PlatformEngineering-DevOpsDayRaleigh.pdf)

[![Checkout the slides](slide.jpg)](PlatformEngineering-DevOpsDayRaleigh.pdf)

### Demo:
Follow the tutorial here https://github.com/cnoe-io/idpbuilder/tree/main/examples/ref-implementation#readme


Easy way to create crossplane credentilas using environment variables
```bash
export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
export REPO_ROOT=$(git rev-parse --show-toplevel)
${REPO_ROOT}/hack/install-provider-secret.sh
```

### Resources
- https://cnoe.io/
- https://github.com/cnoe-io/idpbuilder
- https://github.com/gitops-bridge-dev
- [Enabling Scientists to Collaborate with Amazon EKS and Open Science Studio](https://aws.amazon.com/blogs/opensource/enabling-scientists-to-collaborate-with-amazon-eks-and-open-science-studio/)
