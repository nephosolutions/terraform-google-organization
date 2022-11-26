# Google Cloud Platform project Terraform module

This Terraform module provisions a Google Cloud Platform organization.
It ships the following submodules:

* [audit_config](modules/audit_config)
* [iam_bindings](modules/iam_bindings)
* [iam_memberships](modules/iam_memberships)
* [metadata](modules/metadata)
* [metadata_ssh_keys](modules/metadata/modules/metadata_ssh_keys)
* [project](modules/project)
* [project_services](modules/project_services)

## Usage

```hcl
module "gcp_project" {
  source  = "nephosolutions/organization/google"
  version = "~> 1.0.0"

  billing_account = "..."
  default_region  = "europe-west1"
  default_zone    = "europe-west1-b"
  labels          = {}
  org_id          = "..."
  project_name    = "My GCP Project"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.90 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_audit_config"></a> [audit\_config](#module\_audit\_config) | ./modules/audit_config | n/a |
| <a name="module_bootstrap_project"></a> [bootstrap\_project](#module\_bootstrap\_project) | nephosolutions/gcp-project/google | ~> 6.1.0 |
| <a name="module_iam_bindings"></a> [iam\_bindings](#module\_iam\_bindings) | ./modules/iam_bindings | n/a |
| <a name="module_iam_memberships"></a> [iam\_memberships](#module\_iam\_memberships) | ./modules/iam_memberships | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | the billing\_account to which the project should be attached to | `string` | n/a | yes |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | The zone within a region used by default to create new resources | `string` | n/a | yes |
| <a name="input_editors"></a> [editors](#input\_editors) | Identities that will be granted the basic role `editor` on the organization | `list(string)` | n/a | yes |
| <a name="input_iam_audit_config"></a> [iam\_audit\_config](#input\_iam\_audit\_config) | Map of service APIs which will be enabled for audit logging, with a map of audit log types for which logging is to be configured, with an map of optional attributes including a list of identities that do not cause logging. [google\_folder\_iam\_audit\_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder_iam#google_folder_iam_audit_config) | <pre>map(map(object({<br>    exempted_members = list(string)<br>  })))</pre> | `{}` | no |
| <a name="input_iam_bindings"></a> [iam\_bindings](#input\_iam\_bindings) | Updates the IAM policy to grant a role exclusively to the list of members. | `map(list(string))` | `{}` | no |
| <a name="input_iam_memberships"></a> [iam\_memberships](#input\_iam\_memberships) | Updates the IAM policy to grant a role to a list of members. Non-authoritative for a given role. | `map(list(string))` | `{}` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The numeric ID of the Google Cloud organization. | `string` | n/a | yes |
| <a name="input_owners"></a> [owners](#input\_owners) | Identities that will be granted the basic role `owner` on the organization | `list(string)` | n/a | yes |
| <a name="input_viewers"></a> [viewers](#input\_viewers) | Identities that will be granted the basic role `viewer` on the organization | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
