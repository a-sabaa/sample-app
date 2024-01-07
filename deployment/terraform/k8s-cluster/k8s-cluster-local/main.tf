module "docker-images" {
  source = "./docker-images"

  backend-app-dockerfile = "/deploy/app/backend-app"
  scalable-app-dockerfile = "/deploy/app/scalable-app"
}

module "kind" {
  source = "./kind"

  docker_image_backend_app = module.docker-images.docker_image_backend_app
  docker_image_scalable_app = module.docker-images.docker_image_scalable_app
}