#!/bin/bash
export REPO_ROOT=$(git rev-parse --show-toplevel)
export CNOE_HOST=devopsday.demo.cloud-native-start.com
#./replace.sh devopsday.demo.cloud-native-start.com cnoe.localtest.me 8443
#./replace.sh cnoe.localtest.me devopsday.demo.cloud-native-start.com 8443
set -x

idpbuilder create --protocol https \
  --host $CNOE_HOST \
  --port 8443 --use-path-routing --package-dir ${REPO_ROOT}/examples/ref-implementation-ack
