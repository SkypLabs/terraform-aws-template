# https://www.terraform.io/docs/configuration/terraform.html#terraform-block-syntax.
terraform {
  required_version = ">= 0.13.0"

  required_providers {
    # https://registry.terraform.io/providers/hashicorp/aws.
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
