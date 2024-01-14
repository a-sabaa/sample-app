output "k8s_config_context" {
    value = "kind-${kind_cluster.local-cluster.name}"
    description = "Cluster config for kubectl"
}

output "k8s_config_path" {
    value = kind_cluster.local-cluster.kubeconfig_path
    description = "Kube config file location in cluster"
}