terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kubectl" {
  host                   = module.k8s-cluster.k8s_host_endpoint
  cluster_ca_certificate = base64decode(module.k8s-cluster.k8s_client_certification)
  load_config_file       = false
}

module "k8s-cluster" {
  source = "./k8s-cluster"
  environment = var.environment
}
