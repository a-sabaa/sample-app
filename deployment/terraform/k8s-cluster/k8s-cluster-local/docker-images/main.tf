terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

resource "docker_container" "htpasswd" {
  name = "htpasswd"
  image = "httpd:2"
  command = ["htpasswd", "-Bbn", "testuser", "testpassword", ">", "${abspath(path.module)}/auth/htpasswd"]
  rm = true
}

#source: https://distribution.github.io/distribution/about/deploying/#run-the-registry-as-a-service
resource "docker_container" "local-registry" {
  name = "local-registry"
  restart = "always"
  image = "registry:2"
  ports {
    internal = "5000"
    external = "5000"
  }

  env = ["REGISTRY_AUTH=htpasswd", "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm", "REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd"]

  volumes {
    container_path = "/auth/htpasswd"
    host_path = "${abspath(path.module)}/auth/htpasswd"
  }
}

resource "docker_image" "scalable-app" {
  name = "127.0.0.1:${docker_container.local-registry.ports[0].external}/scalable-app"
  build {
    context = var.scalable-app-dockerfile
    tag     = ["scalable-app:1.0"]
    label = {
      author : "scalable-app"
    }
  }
}

resource "docker_registry_image" "scalable-app" {
  name          = docker_image.scalable-app.name
  keep_remotely = true
  insecure_skip_verify = true
}

resource "docker_image" "backend-app" {
  name = "127.0.0.1:${docker_container.local-registry.ports[0].external}/backend-app"
  build {
    context = var.backend-app-dockerfile
    tag     = ["backend-app:1.0"]
    label = {
      author : "backend-app"
    }
  }
}

resource "docker_registry_image" "backend-app" {
  name          = docker_image.backend-app.name
  keep_remotely = true
  insecure_skip_verify = true
}