module "local-environment" {
  source = "./k8s-cluster-local"
  count = var.environment == "local" ? 1: 0
}

module "aws-environment" {
  source = "./k8s-cluster-aws"
  count = var.environment == "aws" ? 1: 0
}