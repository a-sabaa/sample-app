output "k8s_host_endpoint" {
     value = var.environment == "local" && length(module.local-environment) > 0 ? module.local-environment[0].k8s_host_endpoint : var.environment == "aws" && length(module.aws-environment) > 0 ? module.aws-environment[0].k8s_host_endpoint : null
     description = "Forwards to parent the K8s host endpoint to be used to create the infrastructure using kubectl or helm"
}

output "k8s_client_certification" {
    value = var.environment == "local" && length(module.local-environment) > 0 ? module.local-environment[0].k8s_client_certification : var.environment == "aws" && length(module.aws-environment) > 0 ? module.aws-environment[0].k8s_client_certification : null
     description = "Forwards to parent the K8s client certificate to be used to create the infrastructure using kubectl or helm"
}

output "k8s_config_file_location" {
    value = var.environment == "local" && length(module.local-environment) > 0 ? module.local-environment[0].k8s_config_file_location : var.environment == "aws" && length(module.aws-environment) > 0 ? module.aws-environment[0].k8s_config_file_location : null
    description = "Forwards to parent the K8s client certificate to be used to create the infrastructure using kubectl or helm"
}

output "docker_image_scalable_app" {
    value = var.environment == "local" && length(module.local-environment) > 0 ? module.local-environment[0].docker_image_scalable_app : var.environment == "aws" && length(module.aws-environment) > 0 ? module.aws-environment[0].docker_image_scalable_app : null
    description = "Docker image id that was created for the scalable app"
}

output "docker_image_backend_app" {
    value = var.environment == "local" && length(module.local-environment) > 0 ? module.local-environment[0].docker_image_backend_app : var.environment == "aws" && length(module.aws-environment) > 0 ? module.aws-environment[0].docker_image_backend_app : null
    description = "Docker image id that was created for the backend app"
}