# Terraform AWS Template

Template of a minimal Terraform module for AWS. It is itself based on my [Terraform
Module Template][terraform-module-template].

This module follows the [standard structure][standard-module-structure]
described in the [Terraform documentation][terraform-docs].

The following non-standard but commonly used files and folders have also been
added:

* `local.tf`
* `data.tf`
* `providers.tf`
* `templates`
* `versions.tf`

A [pre-commit][pre-commit] configuration file is present to automatically format
and validate the code and update the readme file upon Git commits.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | AWS access key. It must be provided, but it can also be sourced from the `AWS_ACCESS_KEY_ID` environment variable, or via a shared credentials file if `aws_profile` is specified. | `string` | `null` | no |
| <a name="input_aws_allowed_account_ids"></a> [aws\_allowed\_account\_ids](#input\_aws\_allowed\_account\_ids) | List of allowed AWS account IDs to prevent you from mistakenly using an incorrect one (and potentially end up destroying a live environment). Conflicts with `aws_forbidden_account_ids`. | `set(string)` | `null` | no |
| <a name="input_aws_assume_role"></a> [aws\_assume\_role](#input\_aws\_assume\_role) | Configuration of the AWS assume role block. | <pre>object({<br>    duration_seconds    = number<br>    external_id         = string<br>    policy              = string<br>    policy_arns         = set(string)<br>    role_arn            = string<br>    session_name        = string<br>    tags                = map(string)<br>    transitive_tag_keys = set(string)<br>  })</pre> | <pre>{<br>  "duration_seconds": null,<br>  "external_id": null,<br>  "policy": null,<br>  "policy_arns": null,<br>  "role_arn": null,<br>  "session_name": null,<br>  "tags": null,<br>  "transitive_tag_keys": null<br>}</pre> | no |
| <a name="input_aws_forbidden_account_ids"></a> [aws\_forbidden\_account\_ids](#input\_aws\_forbidden\_account\_ids) | List of forbidden AWS account IDs to prevent you from mistakenly using the wrong one (and potentially end up destroying a live environment). Conflicts with `aws_allowed_account_ids`. | `set(string)` | `null` | no |
| <a name="input_aws_ignore_tags"></a> [aws\_ignore\_tags](#input\_aws\_ignore\_tags) | Configuration of the AWS ignore tags block. | <pre>object({<br>    keys         = set(string)<br>    key_prefixes = set(string)<br>  })</pre> | <pre>{<br>  "key_prefixes": null,<br>  "keys": null<br>}</pre> | no |
| <a name="input_aws_max_retries"></a> [aws\_max\_retries](#input\_aws\_max\_retries) | Maximum number of times an AWS API call is retried, in the case where requests are being throttled or experiencing transient failures. The delay between the subsequent API calls increases exponentially. If omitted, the default value is 25. | `number` | `null` | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | AWS profile name as set in the shared credentials file. | `string` | `null` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region. It must be provided, but it can also be sourced from the `AWS_DEFAULT_REGION` environment variables, or via a shared credentials file if `aws_profile` is specified. | `string` | `null` | no |
| <a name="input_aws_s3_force_path_style"></a> [aws\_s3\_force\_path\_style](#input\_aws\_s3\_force\_path\_style) | Set this to `true` to force the request to use path-style addressing, i.e., `http://s3.amazonaws.com/BUCKET/KEY`. By default, the S3 client will use virtual hosted bucket addressing, `http://BUCKET.s3.amazonaws.com/KEY`, when possible. Specific to the Amazon S3 service. | `bool` | `null` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | AWS secret key. It must be provided, but it can also be sourced from the `AWS_SECRET_ACCESS_KEY` environment variable, or via a shared credentials file if `aws_profile` is specified. | `string` | `null` | no |
| <a name="input_aws_shared_credentials_file"></a> [aws\_shared\_credentials\_file](#input\_aws\_shared\_credentials\_file) | Path to the shared credentials file. If this is not set and a profile is specified, `~/.aws/credentials` will be used. | `string` | `null` | no |
| <a name="input_aws_skip_get_ec2_platforms"></a> [aws\_skip\_get\_ec2\_platforms](#input\_aws\_skip\_get\_ec2\_platforms) | Skip getting the supported EC2 platforms. Used by users that don't have `ec2:DescribeAccountAttributes` permissions. | `bool` | `null` | no |
| <a name="input_aws_token"></a> [aws\_token](#input\_aws\_token) | AWS session token for validating temporary credentials. Typically provided after successful identity federation or Multi-Factor Authentication (MFA) login. With MFA login, this is the session token provided afterward, not the 6 digit MFA code used to get temporary credentials. It can also be sourced from the `AWS_SESSION_TOKEN` environment variable. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether or not this module should create any resources. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags that will be applied to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_account_id"></a> [aws\_account\_id](#output\_aws\_account\_id) | The AWS Account ID number of the account that owns or contains the calling entity. |
| <a name="output_aws_caller_arn"></a> [aws\_caller\_arn](#output\_aws\_caller\_arn) | The AWS ARN associated with the calling entity. |
| <a name="output_aws_caller_user_id"></a> [aws\_caller\_user\_id](#output\_aws\_caller\_user\_id) | The AWS unique identifier of the calling entity. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

 [pre-commit]: https://pre-commit.com/ "pre-commit Website"
 [standard-module-structure]: https://www.terraform.io/docs/modules/index.html#standard-module-structure "Terraform Documentation - Standard Module Structure"
 [terraform-docs]: https://www.terraform.io/docs/ "Terraform Documentation"
 [terraform-module-template]: https://github.com/SkypLabs/terraform-module-template "SkypLabs - Terraform Module Template"
