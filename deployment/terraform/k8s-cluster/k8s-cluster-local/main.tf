module "docker-images" {
  source = "./docker-images"

  backend-app-dockerfile = "/deploy/app/backend-app"
  scalable-app-dockerfile = "/deploy/app/scalable-app"
}

module "kind" {
  source = "./kind"
}