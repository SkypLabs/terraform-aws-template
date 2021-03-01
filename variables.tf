# ----------------------------------------
# Required Variables
# ----------------------------------------

# ----------------------------------------
# Optional Variables
# ----------------------------------------

variable "enabled" {
  description = "Whether or not this module should create any resources."
  type        = bool
  default     = true
}

variable "aws_access_key" {
  description = "AWS access key. It must be provided, but it can also be sourced from the `AWS_ACCESS_KEY_ID` environment variable, or via a shared credentials file if `aws_profile` is specified."
  type        = string
  default     = null
}

variable "aws_secret_key" {
  description = "AWS secret key. It must be provided, but it can also be sourced from the `AWS_SECRET_ACCESS_KEY` environment variable, or via a shared credentials file if `aws_profile` is specified."
  type        = string
  default     = null
}

variable "aws_region" {
  description = "AWS region. It must be provided, but it can also be sourced from the `AWS_DEFAULT_REGION` environment variables, or via a shared credentials file if `aws_profile` is specified."
  type        = string
  default     = null
}

variable "aws_profile" {
  description = "AWS profile name as set in the shared credentials file."
  type        = string
  default     = null
}

variable "aws_assume_role" {
  description = "Configuration of the AWS assume role block."
  type = object({
    duration_seconds    = number
    external_id         = string
    policy              = string
    policy_arns         = set(string)
    role_arn            = string
    session_name        = string
    tags                = map(string)
    transitive_tag_keys = set(string)
  })
  default = {
    duration_seconds    = null
    external_id         = null
    policy              = null
    policy_arns         = null
    role_arn            = null
    session_name        = null
    tags                = null
    transitive_tag_keys = null
  }
}

variable "aws_shared_credentials_file" {
  description = "Path to the shared credentials file. If this is not set and a profile is specified, `~/.aws/credentials` will be used."
  type        = string
  default     = null
}

variable "aws_token" {
  description = "AWS session token for validating temporary credentials. Typically provided after successful identity federation or Multi-Factor Authentication (MFA) login. With MFA login, this is the session token provided afterward, not the 6 digit MFA code used to get temporary credentials. It can also be sourced from the `AWS_SESSION_TOKEN` environment variable."
  type        = string
  default     = null
}

variable "aws_max_retries" {
  description = "Maximum number of times an AWS API call is retried, in the case where requests are being throttled or experiencing transient failures. The delay between the subsequent API calls increases exponentially. If omitted, the default value is 25."
  type        = number
  default     = null
}

variable "aws_allowed_account_ids" {
  description = "List of allowed AWS account IDs to prevent you from mistakenly using an incorrect one (and potentially end up destroying a live environment). Conflicts with `aws_forbidden_account_ids`."
  type        = set(string)
  default     = null
}

variable "aws_forbidden_account_ids" {
  description = "List of forbidden AWS account IDs to prevent you from mistakenly using the wrong one (and potentially end up destroying a live environment). Conflicts with `aws_allowed_account_ids`."
  type        = set(string)
  default     = null
}

variable "aws_ignore_tags" {
  description = "Configuration of the AWS ignore tags block."
  type = object({
    keys         = set(string)
    key_prefixes = set(string)
  })
  default = {
    keys         = null
    key_prefixes = null
  }
}

variable "aws_skip_get_ec2_platforms" {
  description = "Skip getting the supported EC2 platforms. Used by users that don't have `ec2:DescribeAccountAttributes` permissions."
  type        = bool
  default     = null
}

variable "aws_s3_force_path_style" {
  description = "Set this to `true` to force the request to use path-style addressing, i.e., `http://s3.amazonaws.com/BUCKET/KEY`. By default, the S3 client will use virtual hosted bucket addressing, `http://BUCKET.s3.amazonaws.com/KEY`, when possible. Specific to the Amazon S3 service."
  type        = bool
  default     = null
}

variable "tags" {
  description = "Tags that will be applied to all resources."
  type        = map(string)
  default     = {}
}
