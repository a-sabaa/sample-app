terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}


#Helm experiment failed, got error while creating ingress controller that I could not figure out, trying manual creation in kubectl
# provider "helm" {
#   kubernetes {
#     config_path = module.k8s-cluster.k8s_config_file_location
#     host = module.k8s-cluster.k8s_host_endpoint
#   }
# }

provider "docker" {
  registry_auth {
    address     = "127.0.0.1:5000"
    username    = "testuser"
    password    = "testpassword"
  }
}

provider "kubectl" {
  host                   = module.k8s-cluster.k8s_host_endpoint
  config_path            = module.k8s-cluster.k8s_config_file_location
}

module "k8s-cluster" {
  source = "./k8s-cluster"
  environment = var.environment
}

# module "helm" {
#   source = "./helm"
# }

module "kubectl" {
  source = "./kubectl"

  docker_image_backend_app = module.k8s-cluster.docker_image_backend_app
  docker_image_scalable_app = module.k8s-cluster.docker_image_scalable_app
}