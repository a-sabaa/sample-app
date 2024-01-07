terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}


resource "docker_image" "scalable-app" {
  name = "scalable-app"
  build {
    context = var.scalable-app-dockerfile
    tag     = ["scalable-app:1.0"]
    label = {
      author : "scalable-app"
    }
  }
}

resource "docker_image" "backend-app" {
  name = "backend-app"
  build {
    context = var.backend-app-dockerfile
    tag     = ["backend-app:1.0"]
    label = {
      author : "backend-app"
    }
  }
}