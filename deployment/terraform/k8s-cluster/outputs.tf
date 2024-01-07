locals {
  // Map environments to their respective modules
  environment_modules = {
    "local" = module.local-environment,
    "aws"   = module.aws-environment
  }

  // Function to retrieve the correct module output
  get_output = {
    for env, mod in local.environment_modules : 
    env => length(mod) > 0 ? mod[0] : null
  }
}

output "k8s_host_endpoint" {
    value = lookup(local.get_output[var.environment], "k8s_host_endpoint")
    description = "Forwards to parent the K8s host endpoint to be used to create the infrastructure using kubectl or helm"
}

output "k8s_client_certificate" {
    value = lookup(local.get_output[var.environment], "k8s_client_certificate")
    description = "Forwards to parent the K8s client certificate to be used to create the infrastructure using kubectl or helm"
}

output "k8s_config_context_cluster" {
    value = lookup(local.get_output[var.environment], "k8s_config_context_cluster")
    description = "Cluster config for kubectl"
}

output "docker_image_scalable_app" {
    value = lookup(local.get_output[var.environment], "docker_image_scalable_app")
    description = "Docker image id that was created for the scalable app"
}

output "docker_image_backend_app" {
    value = lookup(local.get_output[var.environment], "docker_image_backend_app")
    description = "Docker image id that was created for the backend app"
}


