#!/bin/bash
export REPO_ROOT=$(git rev-parse --show-toplevel)
#./replace.sh cnoe.localtest.me 8443 devopsday.demo.cloud-native-start.com
#./replace.sh ack.demo.cloud-native-start.com 8443 cnoe.localtest.me
set -x

idpbuilder create --use-path-routing --package-dir ${REPO_ROOT}/examples/ack/ref-implementation-ack-local
