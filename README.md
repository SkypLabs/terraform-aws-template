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
| terraform | >= 0.12.0 |

## Providers

No provider.

## Inputs

No input.

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

 [pre-commit]: https://pre-commit.com/ "pre-commit Website"
 [standard-module-structure]: https://www.terraform.io/docs/modules/index.html#standard-module-structure "Terraform Documentation - Standard Module Structure"
 [terraform-docs]: https://www.terraform.io/docs/ "Terraform Documentation"
