#!/bin/bash
export REPO_ROOT=$(git rev-parse --show-toplevel)
set -x

echo idpbuilder create --use-path-routing --package-dir ${REPO_ROOT}/examples/ref-implementation-devopsday --no-exit 
  
