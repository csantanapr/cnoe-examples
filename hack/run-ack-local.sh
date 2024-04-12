#!/bin/bash
export REPO_ROOT=$(git rev-parse --show-toplevel)
#./replace.sh cnoe.localtest.me 8443
set -x

idpbuilder create --use-path-routing --package-dir ${REPO_ROOT}/examples/ref-implementation-ack-local
