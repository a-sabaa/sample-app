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