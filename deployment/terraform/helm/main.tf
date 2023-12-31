resource "helm_release" "ingress-nginx" {
  name          = "ingress-nginx"
  chart         = "ingress-nginx"
  repository    = "https://kubernetes.github.io/ingress-nginx"
}
