variable "docker_image_scalable_app" {
    type = string
    description = "Docker image id that is used to create scalable app deployment"
}

variable "docker_image_backend_app" {
    type = string
    description = "Docker image id that is used to create backend app deployment"
}

variable "docker_registry_name" {
    type = string
    description = "Name of docker registry where images are pulled from"
}

variable "docker_registry_port" {
    type = string
    description = "Port of docker registry where images are pulled from"
}