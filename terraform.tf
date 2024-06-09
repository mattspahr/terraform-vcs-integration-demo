terraform {

  # cloud {
  #   organization = "ms_vcs_demo_org"

  #   workspaces {
  #     name = "terraform-vcs-integration-demo"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

provider "aws" {
  region = var.region
}