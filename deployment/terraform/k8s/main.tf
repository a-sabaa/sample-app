locals {
  backend_app_name = "backend-app"
  scalable_app_name = "scalable-app"
}

terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.25.1"
    }
  }
}

resource "kubernetes_config_map_v1" "ngninx-config-map" {
  metadata {
    name = "nginx-config"
  }
}

resource "kubernetes_ingress_class_v1" "nginx-ingress-class" {
  metadata {
    name = "nginx"
    annotations = {
      "ingressclass.kubernetes.io/is-default-class" = true
    }
  }

  spec {
    controller = "nginx.org/ingress-controller"
  }
}

resource "kubernetes_ingress_v1" "nginx-ingress-resource" {
  metadata {
    name = "nginx-ingress"
  }

  spec {
    ingress_class_name = "nginx"
    tls {
      hosts = [
        "sample-app.com",
        "backend-app.com"
      ]
    }
    default_backend {
      service {
        name = "scalable-app"
        port {
          number = 80
        }
      }
    }

    rule {
      http {
        path {
          backend {
            service {
              name = "scalable-app"
              port {
                number = 80
              }
            }
          }

          path = "/scalable"
          path_type = "Prefix"
        }

        path {
          backend {
            service {
              name = "backend-app"
              port {
                number = 80
              }
            }
          }

          path = "/backend"
          path_type = "Prefix"
        }
      }
    }
  }
}

resource "kubernetes_deployment_v1" "backend-app" {
  metadata {
    name = local.backend_app_name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = local.backend_app_name
      }
    }

    template {
      metadata {
        labels = {
          app = local.backend_app_name
        }
      }

      spec {
        container {
          image = var.docker_image_backend_app
          name  = local.backend_app_name
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "backend-app" {
  metadata {
    name = local.backend_app_name
  }
  spec {
    selector = {
      app = local.backend_app_name
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_deployment_v1" "scalable-app" {
  metadata {
    name = local.scalable_app_name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = local.scalable_app_name
      }
    }

    template {
      metadata {
        labels = {
          app = local.scalable_app_name
        }
      }

      spec {
        container {
          image = var.docker_image_scalable_app
          name  = local.scalable_app_name
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "scalable-app" {
  metadata {
    name = local.scalable_app_name
  }
  spec {
    selector = {
      app = local.scalable_app_name
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "ClusterIP"
  }
}
