# https://www.terraform.io/docs/configuration/locals.html.
locals {
  # The account id is also the root id.
  account_id = data.aws_caller_identity.current.account_id

  # ARN of the root account.
  root_arn = "arn:aws:iam::${local.account_id}:root"

  # True if the caller is the root account. False otherwise.
  is_caller_root = local.account_id == data.aws_caller_identity.current.user_id
}
