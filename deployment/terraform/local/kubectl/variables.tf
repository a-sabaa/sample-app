variable "k8s_host_endpoint" {
    type = string
}

variable "k8s_client_certification" {
    type = kind_cluster.local_cluster.client_certificate
}