#!/bin/bash

# Check if the environment variable is provided
if [ "$#" -ne 1 ]; then
    echo "An environment for deployment must be given (local, aws)"
    exit 1
fi

# Get the absolute path of the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define paths
APP_PATH="$SCRIPT_DIR/../app"
TERRAFORM_PATH="$SCRIPT_DIR/../deployment/terraform"


# Assign the first argument to the 'environment' variable
environment=$1

# Build the Docker image
docker build -t terraform-sample-app .

# Run the Docker container with the environment variable
docker run \
    --mount type=bind,source="$AppPath",target="/deploy/app" \
    --mount type=bind,source="$TerraformPath",target="/deploy/terraform" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    terraform-sample-app init \
    -var="environment=$environment"

docker run \
    --mount type=bind,source="$AppPath",target="/deploy/app" \
    --mount type=bind,source="$TerraformPath",target="/deploy/terraform" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    terraform-sample-app apply \
    -auto-approve \
    -var="environment=$environment"
