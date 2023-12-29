variable "backend-app-dockerfile" {
    type = string
    description = "Folder directory containing Dockerfile given to create the local backend app docker image"
}

variable "scalable-app-dockerfile" {
    type = string
    description = "Folder directory containing Dockerfile given to create the local scalable app docker image"
}