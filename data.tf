# https://www.terraform.io/docs/configuration/data-sources.html.

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity.
data "aws_caller_identity" "current" {}
