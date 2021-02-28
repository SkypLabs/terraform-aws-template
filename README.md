# Terraform Module Template

Template of a minimal Terraform module.

This module follows the [standard structure][standard-module-structure] described in the [Terraform documentation][terraform-docs].

The following non-standard but commonly used files and folders have also been added:

* `local.tf`
* `data.tf`
* `templates`

A [pre-commit][pre-commit] configuration file is present to automatically format and validate the code and update the readme file upon Git commits.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 3.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_access\_key | AWS access key. It must be provided, but it can also be sourced from the 'AWS\_ACCESS\_KEY\_ID' environment variable, or via a shared credentials file if 'aws\_profile' is specified. | `string` | `null` | no |
| aws\_allowed\_account\_ids | List of allowed AWS account IDs to prevent you from mistakenly using an incorrect one (and potentially end up destroying a live environment). Conflicts with 'aws\_forbidden\_account\_ids'. | `set(string)` | `null` | no |
| aws\_assume\_role | Configuration of the AWS assume role block. | <pre>object({<br>    duration_seconds    = number<br>    external_id         = string<br>    policy              = string<br>    policy_arns         = set(string)<br>    role_arn            = string<br>    session_name        = string<br>    tags                = map(string)<br>    transitive_tag_keys = set(string)<br>  })</pre> | <pre>{<br>  "duration_seconds": null,<br>  "external_id": null,<br>  "policy": null,<br>  "policy_arns": null,<br>  "role_arn": null,<br>  "session_name": null,<br>  "tags": null,<br>  "transitive_tag_keys": null<br>}</pre> | no |
| aws\_forbidden\_account\_ids | List of forbidden AWS account IDs to prevent you from mistakenly using the wrong one (and potentially end up destroying a live environment). Conflicts with 'aws\_allowed\_account\_ids'. | `set(string)` | `null` | no |
| aws\_max\_retries | Maximum number of times an AWS API call is retried, in the case where requests are being throttled or experiencing transient failures. The delay between the subsequent API calls increases exponentially. If omitted, the default value is 25. | `number` | `null` | no |
| aws\_profile | AWS profile name as set in the shared credentials file. | `string` | `null` | no |
| aws\_region | AWS region. It must be provided, but it can also be sourced from the 'AWS\_DEFAULT\_REGION' environment variables, or via a shared credentials file if 'aws\_profile' is specified. | `string` | `null` | no |
| aws\_secret\_key | AWS secret key. It must be provided, but it can also be sourced from the 'AWS\_SECRET\_ACCESS\_KEY' environment variable, or via a shared credentials file if 'aws\_profile' is specified. | `string` | `null` | no |
| aws\_shared\_credentials\_file | Path to the shared credentials file. If this is not set and a profile is specified, '~/.aws/credentials' will be used. | `string` | `null` | no |
| aws\_token | AWS session token for validating temporary credentials. Typically provided after successful identity federation or Multi-Factor Authentication (MFA) login. With MFA login, this is the session token provided afterward, not the 6 digit MFA code used to get temporary credentials. It can also be sourced from the 'AWS\_SESSION\_TOKEN' environment variable. | `string` | `null` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

 [pre-commit]: https://pre-commit.com/ "pre-commit Website"
 [standard-module-structure]: https://www.terraform.io/docs/modules/index.html#standard-module-structure "Terraform Documentation - Standard Module Structure"
 [terraform-docs]: https://www.terraform.io/docs/ "Terraform Documentation"
