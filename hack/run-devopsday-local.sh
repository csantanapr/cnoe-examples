#!/bin/bash
export REPO_ROOT=$(git rev-parse --show-toplevel)
export CNOE_HOST=devopsday.demo.cloud-native-start.com
#./replace.sh cnoe.localtest.me 8443
set -x

idpbuilder create --use-path-routing --package-dir ${REPO_ROOT}/examples/ref-implementation-devopsday

