module "docker-images" {
  source = "./docker-images"

  backend-app-dockerfile = "/deploy/app/backend-app"
  scalable-app-dockerfile = "/deploy/app/scalable-app"
}

module "kind" {
  source = "./kind"
}

module "kubectl" {
  source = "./kubectl"

  k8s_host_endpoint = module.kind.k8s_host_endpoint
  k8s_client_certification = module.kind.k8s_client_certification
}