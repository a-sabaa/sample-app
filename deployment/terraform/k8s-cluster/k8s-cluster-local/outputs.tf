output "k8s_config_path" {
    value = module.kind.k8s_config_path
    description = "Cluster config for k8s"
}

output "k8s_config_context" {
    value = module.kind.k8s_config_context
    description = "Cluster config context for k8s"
}

output "docker_image_scalable_app" {
    value = module.docker-images.docker_image_scalable_app
    description = "Docker image name that was created for the scalable app"
}

output "docker_image_backend_app" {
    value = module.docker-images.docker_image_backend_app
    description = "Docker image name that was created for the backend app"
}