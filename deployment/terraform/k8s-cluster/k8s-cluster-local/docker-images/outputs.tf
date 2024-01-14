output "docker_image_scalable_app" {
    value = element(docker_image.scalable-app.build[*].tag[0], 0)
    description = "Docker image name that was created for the scalable app"
}

output "docker_image_backend_app" {
    value = element(docker_image.backend-app.build[*].tag[0], 0)
    description = "Docker image name that was created for the backend app"
}