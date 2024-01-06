terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.12.1"
    }
  }
}

resource "helm_release" "ingress-nginx" {
  name          = "ingress-nginx"
  chart         = "ingress-nginx"
  repository    = "https://kubernetes.github.io/ingress-nginx"
  version       = "4.9.0"
  # set {
  #   name  = "service.type"
  #   value = "ClusterIP"
  # }

}
