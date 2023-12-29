output "k8s_host_endpoint" {
     value = var.environment == "local" && length(module.local-environment) > 0 ? module.local-environment[0].k8s_host_endpoint : var.environment == "aws" && length(module.aws-environment) > 0 ? module.aws-environment[0].k8s_host_endpoint : null
}

output "k8s_client_certification" {
    value = var.environment == "local" && length(module.local-environment) > 0 ? module.local-environment[0].k8s_client_certification : var.environment == "aws" && length(module.aws-environment) > 0 ? module.aws-environment[0].k8s_client_certification : null
}