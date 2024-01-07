locals {
  cluster-name = "local-cluster"
}

resource "null_resource" "create_kind_cluster" {
  provisioner "local-exec" {
    command = "kind create cluster --name ${local.cluster-name} --image kindest/node:v1.29.0 --config ${path.module}/kind-config.yml"
  }
}

# These 2 workarounds exist because loading docker images into kind cluster created by provider was not possible
# and using output for commands running in null resource for terraform only works through file system retention
resource "null_resource" "get_k8s_host_endpoint" {
  depends_on = [ null_resource.create_kind_cluster,  null_resource.get_k8s_client_certificate ]
  provisioner "local-exec" {
    command = "kubectl cluster-info --context kind-local-cluster | head -n 1 | awk '{print $NF}' | sed 's/\\x1B\\[[0-9;]\\{1,\\}[A-Za-z]//g' > ${path.module}/k8s_host_endpoint.txt"
  }
}

resource "null_resource" "get_k8s_client_certificate" {
  depends_on = [ null_resource.create_kind_cluster ]
  provisioner "local-exec" {
    command = "kubectl config view --raw --minify --context kind-${local.cluster-name} | grep 'client-certificate-data' | cut -d ' ' -f 6 > ${path.module}/k8s_client_certificate.txt"
  }
}


# Manual load to avoid having to use local registry
resource "null_resource" "load_scalable_image_to_kind" {
  depends_on = [null_resource.create_kind_cluster]
  provisioner "local-exec" {
    command = "kind load docker-image ${var.docker_image_scalable_app} --name ${local.cluster-name}"
  }
}

resource "null_resource" "load_backend_image_to_kind" {
  depends_on = [null_resource.create_kind_cluster]
  provisioner "local-exec" {
    command = "kind load docker-image ${var.docker_image_backend_app} --name ${local.cluster-name}"
  }
}