output "k8s_host_endpoint" {
    value = file("${path.module}/k8s_host_endpoint.txt")
    description = "API endpoint to communicate with kind cluster"
}

output "k8s_client_certificate" {
    value = file("${path.module}/k8s_client_certificate.txt")
    description = "client certificate required to sign requests sent to the kind cluster"
}

output "k8s_config_context_cluster" {
    value = "kind-local-cluster"
    description = "Cluster config for kubectl"
}