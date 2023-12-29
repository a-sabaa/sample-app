terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

resource "kind_cluster" "local_cluster" {
    depends_on      = []
    name            = "local-cluster"
    wait_for_ready  = true
    node_image      = "kindest/node:v1.29.0"

  kind_config {
      kind              = "Cluster"
      api_version       = "kind.x-k8s.io/v1alpha4"

      node {
          role = "control-plane"

          kubeadm_config_patches = [
              "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
          ]

          extra_port_mappings {
              container_port = 80
              host_port      = 80
              protocol       = "TCP"
          }
          extra_port_mappings {
              container_port = 443
              host_port      = 443
              protocol       = "TCP"
          }
      }

      node {
        role  = "worker"
      }

      node {
        role  = "worker"
      }

      node {
        role  = "worker"
      }
  }
}
