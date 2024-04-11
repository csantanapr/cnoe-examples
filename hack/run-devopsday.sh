#!/bin/bash
export REPO_ROOT=$(git rev-parse --show-toplevel)
export CNOE_HOST=ec2-18-232-146-175.compute-1.amazonaws.com
#./replace.sh ec2-18-232-146-175.compute-1.amazonaws.com 8443
set -x

echo idpbuilder create --protocol https --no-exit  \
  --host $CNOE_HOST \
  --port 8443 --use-path-routing --package-dir ${REPO_ROOT}/examples/ref-implementation-devopsday
  
