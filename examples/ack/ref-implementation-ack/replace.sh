# this script replaces hostname and port used by this implementation.
# intended for use in environments such as Codespaces where external host and port need to be updated to access in-cluster resources.

#!/bin/bash
set -ex
# Check if the new port number is provided as an argument
if [ "$#" -ne 3 ]; then
    echo "Usage: NEW_HOST NEW_PORT OLD_HOST"
    exit 1
fi

# Assign the first script argument to NEW_PORT
NEW_HOST="$1"
NEW_PORT="$2"
OLD_HOST="$3"

# Base directory to start from, "." means the current directory
CURRENT_DIR=$(echo "${PWD##*/}")
if [[ ${CURRENT_DIR} != "ref-implementation-ack" ]]; then
  echo "please run this script from the examples/ref-implementation directory"
  exit 10
fi
BASE_DIRECTORY="."

# Find all .yaml files recursively starting from the base directory
# and perform an in-place search and replace from 8443 to the new port
find "$BASE_DIRECTORY" -type f -name "*.yaml" -exec sed -i '' -e "s/8443/${NEW_PORT}/g" {} +
find "$BASE_DIRECTORY" -type f -name "*.yaml" -exec sed -i '' -e "s/${OLD_HOST}/${NEW_HOST}/g" {} +

# Remove hostname-port configuration if the new port is 443. Browsers strip 443 but keycloak still expects 443 in url.
if [[ ${NEW_PORT} == "443" ]]; then
  sed -i "/hostname-port/d" keycloak/manifests/install.yaml
  sed -i "/hostname-admin/d" keycloak/manifests/install.yaml
  sed -i '0,/:443/{s/:443//}' argo-workflows/manifests/dev/patches/cm-argo-workflows.yaml
fi

echo "Replacement complete."