terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

locals {
  tags = {
    Project = "perf"
  }
}

module "common" {
  source = "./common"
  region = "us-west-2"

  common_tags = local.tags
}

module "server_region" {
  source = "./region"
  region = "us-west-2"
  ami    = "ami-0747e613a2a1ff483"

  common_tags = local.tags
}

module "client_region" {
  source = "./region"
  region = "us-east-1"
  ami    = "ami-06e46074ae430fba6"

  common_tags = local.tags
}
