output "k8s_host_endpoint" {
    value = module.kind.k8s_host_endpoint
    description = "Outputs the chosen k8s cluster endpoint to main root terraform code, used by main root to define the manifest or helm chart to build the actual infrastructure architecture"
}

output "k8s_client_certification" {
    value = module.kind.k8s_client_certification
    description = "Outputs the chosen k8s cluster certification to main root terraform code, used by main root to define the manifest or helm chart to build the actual infrastructure architecture"
}

output "k8s_config_file_location" {
    value = module.kind.k8s_config_file_location
    description = "Kube config file location in cluster"
}

output "docker_image_scalable_app" {
    value = module.docker-images.docker_image_scalable_app
    description = "Docker image id that was created for the scalable app"
}

output "docker_image_backend_app" {
    value = module.docker-images.docker_image_backend_app
    description = "Docker image id that was created for the backend app"
}