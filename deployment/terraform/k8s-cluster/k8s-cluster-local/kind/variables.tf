variable "docker_image_backend_app" {
    type = string
    description = "Docker image to load into kind for backend app"
}

variable "docker_image_scalable_app" {
    type = string
    description = "Docker image to load into kind for scalable app"
}

variable "k8s_cluster_name" {
    type = string
    default = "local-cluster"
    description = "Name of local cluster to be created"
}