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
# module "helm" {
#   source = "./helm"
# }

provider "kubectl" {
  config_context_cluster = module.k8s-cluster.k8s_config_context_cluster
  load_config_file       = true
  config_path            = "$HOME/kube/config"
}

module "k8s-cluster" {
  source = "./k8s-cluster"
  environment = var.environment
}

module "kubectl" {
  source = "./kubectl"

  docker_image_backend_app = module.k8s-cluster.docker_image_backend_app
  docker_image_scalable_app = module.k8s-cluster.docker_image_scalable_app
}