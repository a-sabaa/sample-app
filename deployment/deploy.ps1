# PowerShell script

# Check if the environment variable is provided
if ($args.Length -ne 1) {
    Write-Host "An environment for deployment must be given (local, aws)"
    exit 1
}

# Define paths
$AppPath = Join-Path $PSScriptRoot "..\app"
$TerraformPath = Join-Path $PSScriptRoot "..\deployment\terraform"

# Assign the first argument to the 'environment' variable
$environment = $args[0]

# Build the Docker image
docker build -t terraform-sample-app .

# Run the Docker container with the environment variable
docker run `
    --mount type=bind,source="${AppPath}",target="/deploy/app" `
    --mount type=bind,source="${TerraformPath}",target="/deploy/terraform" `
    -v //var/run/docker.sock:/var/run/docker.sock `
    terraform-sample-app init `
    -var="environment=$environment"

docker run `
    --mount type=bind,source="${AppPath}",target="/deploy/app" `
    --mount type=bind,source="${TerraformPath}",target="/deploy/terraform" `
    -v //var/run/docker.sock:/var/run/docker.sock `
    terraform-sample-app apply `
    -auto-approve `
    -var="environment=$environment"