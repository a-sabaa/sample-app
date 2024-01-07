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
docker build --build-arg DEPLOY_ENV=$environment -t terraform-sample-app .

# Run the Docker container with the environment variable
# Mount is for pushing the code into the docker container
# docker.sock is to enable docker containers to create docker containers on host machine
# net=host allows the container to share 127.0.0.1 ip with the host
docker run --rm \
    --mount type=bind,source="$AppPath",target="/deploy/app" \
    --mount type=bind,source="$TerraformPath",target="/deploy/terraform" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --net=host \ 
    terraform-sample-app init \
    -var="environment=$environment"

docker run --rm \
    --mount type=bind,source="$AppPath",target="/deploy/app" \
    --mount type=bind,source="$TerraformPath",target="/deploy/terraform" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --net=host \
    terraform-sample-app apply -auto-approve \
    -var="environment=$environment"
