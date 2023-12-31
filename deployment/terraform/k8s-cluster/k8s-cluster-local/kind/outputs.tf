output "k8s_host_endpoint" {
    value = kind_cluster.local_cluster.endpoint
    description = "API endpoint to communicate with kind cluster"
}

output "k8s_client_certification" {
    value = kind_cluster.local_cluster.client_certificate
    description = "client certificate required to sign requests sent to the kind cluster"
}

output "k8s_config_file_location" {
    value = kind_cluster.local_cluster.kubeconfig_path
    description = "Kube config file location in cluster"
}