output "k8s_host_endpoint" {
    value = module.kind.k8s_host_endpoint
    description = "Outputs the chosen k8s cluster endpoint to main root terraform code, used by main root to define the manifest or helm chart to build the actual infrastructure architecture"
}

output "k8s_client_certificate" {
    value = module.kind.k8s_client_certificate
    description = "Outputs the chosen k8s cluster certification to main root terraform code, used by main root to define the manifest or helm chart to build the actual infrastructure architecture"
}

output "k8s_config_context_cluster" {
    value = module.kind.k8s_config_context_cluster
    description = "Cluster config for kubectl"
}

output "docker_image_scalable_app" {
    value = module.docker-images.docker_image_scalable_app
    description = "Docker image name that was created for the scalable app"
}

output "docker_image_backend_app" {
    value = module.docker-images.docker_image_backend_app
    description = "Docker image name that was created for the backend app"
}


output "docker_registry_port" {
    value = module.docker-images.docker_registry_port
    description = "Docker image id that was created for the scalable app"
}

output "docker_registry_name" {
    value = module.docker-images.docker_registry_name
    description = "Docker image id that was created for the backend app"
}