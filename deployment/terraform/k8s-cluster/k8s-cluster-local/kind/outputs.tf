output "k8s_host_endpoint" {
    value = kind_cluster.local_cluster.endpoint
}

output "k8s_client_certification" {
    value = kind_cluster.local_cluster.client_certificate
}