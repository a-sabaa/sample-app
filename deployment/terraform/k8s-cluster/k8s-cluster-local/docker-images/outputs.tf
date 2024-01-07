output "docker_image_scalable_app" {
    value = docker_image.scalable-app.image_id
    description = "Docker image id that was created for the scalable app"
}

output "docker_image_backend_app" {
    value = docker_image.backend-app.image_id
    description = "Docker image id that was created for the backend app"
}

output "docker_registry_name" {
    value = docker_container.local-registry.name
    description = "Local docker registry name"
}

output "docker_registry_port" {
    value = docker_container.local-registry.ports[0].external
    description = "Local docker registry port"
}