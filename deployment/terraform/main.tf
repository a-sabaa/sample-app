terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.12.1"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = module.k8s-cluster.k8s_config_file_location
    host = module.k8s-cluster.k8s_host_endpoint
  }
}

provider "kubectl" {
  host                   = module.k8s-cluster.k8s_host_endpoint
  load_config_file       = false
}

module "k8s-cluster" {
  source = "./k8s-cluster"
  environment = var.environment
}

module "helm" {
  source = "./helm"
}

module "kubectl" {
  source = "./kubectl"
}