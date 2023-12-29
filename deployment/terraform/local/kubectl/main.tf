terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kubectl" {
  host                   = var.k8s_host_endpoint
  cluster_ca_certificate = base64decode(var.k8s_client_certification)
  load_config_file       = false
}

# resource "kubectl_manifest" "manifest" {
#     yaml_body = <<YAML
# apiVersion: networking.k8s.io/v1
# kind: Ingress
# metadata:
#   name: test-ingress
#   annotations:
#     nginx.ingress.kubernetes.io/rewrite-target: /
#     azure/frontdoor: enabled
# spec:
#   rules:
#   - http:
#       paths:
#       - path: /testpath
#         pathType: "Prefix"
#         backend:
#           serviceName: test
#           servicePort: 80
# YAML
# }
