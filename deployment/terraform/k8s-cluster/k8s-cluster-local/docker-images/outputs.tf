output "docker_image_scalable_app" {
    value = docker_image.scalable-app.image_id
    description = "Docker image id that was created for the scalable app"
}

output "docker_image_backend_app" {
    value = docker_image.backend-app.image_id
    description = "Docker image id that was created for the backend app"
}