# https://registry.terraform.io/providers/hashicorp/aws.
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
  profile    = var.aws_profile

  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs#assume_role-configuration-block.
  assume_role {
    duration_seconds    = var.aws_assume_role.duration_seconds
    external_id         = var.aws_assume_role.external_id
    policy              = var.aws_assume_role.policy
    policy_arns         = var.aws_assume_role.policy_arns
    role_arn            = var.aws_assume_role.role_arn
    session_name        = var.aws_assume_role.session_name
    tags                = var.aws_assume_role.tags
    transitive_tag_keys = var.aws_assume_role.transitive_tag_keys
  }

  shared_credentials_file = var.aws_shared_credentials_file
  token                   = var.aws_token
  max_retries             = var.aws_max_retries
  allowed_account_ids     = var.aws_allowed_account_ids
  forbidden_account_ids   = var.aws_forbidden_account_ids

  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs#ignore_tags-configuration-block.
  ignore_tags {
    keys         = var.aws_ignore_tags.keys
    key_prefixes = var.aws_ignore_tags.key_prefixes
  }

  skip_get_ec2_platforms = var.aws_skip_get_ec2_platforms
  s3_force_path_style    = var.aws_s3_force_path_style
}
