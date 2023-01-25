locals {
  env    = replace(path_relative_to_include(), "/\\/.+/", "")
  region = "ap-northeast-1"
}

generate "terraform" {
  path      = "_versions.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
  terraform {
    required_version = "1.3.6"
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "4.48.0"
      }
      datadog = {
        version = "3.19.1"
        source  = "Datadog/datadog"
      }
    }
    backend "s3" {
      bucket = "ortega-tfstate"
      key    = "${path_relative_to_include()}.tfstate"
      region = "${local.region}"
    }
  }
  
  provider "aws" {
    region = "${local.region}"

    default_tags {
      tags = {
        CmBillingGroup = "${local.env}_ortega"
        Env            = "${local.env}"
        Project        = "ortega"
      }
    }
  }
EOF
}

generate "variables" {
  path      = "_variables.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
  variable "env" {
    type = string
  }
EOF
}

inputs = {
  env = local.env
}
