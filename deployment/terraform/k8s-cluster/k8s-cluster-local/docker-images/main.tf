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
    tag     = ["scalable-app:develop"]
    label = {
      author : "scalable-app"
    }
  }
}

resource "docker_image" "backend-app" {
  name = "backend-app"
  build {
    context = var.backend-app-dockerfile
    tag     = ["backend-app:develop"]
    label = {
      author : "backend-app"
    }
  }
}