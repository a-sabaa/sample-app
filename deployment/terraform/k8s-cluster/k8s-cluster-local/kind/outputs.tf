output "k8s_config_context" {
    value = "kind-${var.k8s_cluster_name}"
    description = "Cluster config for kubectl"
    precondition {
        condition     = null_resource.create_kind_cluster.id
        error_message = "Kind cluster not created yet."
    }
}

output "k8s_config_path" {
    value = "${path.module}/kubeconfig.yml"
    description = "Kube config file location in cluster"
}