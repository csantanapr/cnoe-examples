#!/bin/bash
export REPO_ROOT=$(git rev-parse --show-toplevel)
envsubst < ${REPO_ROOT}/hack/crossplane-provider-secret.yaml | kubectl apply -f -
