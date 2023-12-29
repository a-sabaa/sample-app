terraform {
  
}

module "local-environment" {
  source = "./local"
  count = var.environment == "local" ? 1: 0
}

module "aws-environment" {
  source = "./aws"
  count = var.environment == "aws" ? 1: 0
}
