# Google Compute Engine metadata Terraform module

This Terraform module configures authoritatively the IAM policy for basic, predefined or custom roles.
Any existing policy will be replaced by this module.

There are several basic roles that existed prior to the introduction of IAM:
Owner, Editor, and Viewer. These roles are concentric; that is, the Owner role includes the permissions in the Editor role,
and the Editor role includes the permissions in the Viewer role. They were originally known as "primitive roles."

Caution:
  Basic roles include thousands of permissions across all Google Cloud services.
  In production environments, do not grant basic roles unless there is no alternative.
  Instead, grant the most limited predefined roles or custom roles that meet your needs.


## Usage

```hcl
module "iam_bindings" {
  source  = "nephosolutions/organization/google//modules/iam_bindings"
  version = "~> 1.0.0"

  org_id  = "0123456789123"

  // IAM bindings for predefined or custom roles
  bindings = {
    "my-custom-role" = ["user:foobar@example.com"]
    "roles/compute.admin" = ["user:foobar@example.com"]
  }

  // All viewer permissions, plus permissions for actions that modify state, such as changing existing resources.
  editors = []

  /* All editor permissions and permissions for the following actions:
          - Manage roles and permissions for a project and all resources within the project.
          - Set up billing for a project. */
  owners  = []

  /* Permissions for read-only actions that do not affect state,
      such as viewing (but not modifying) existing resources or data. */
  viewers = []
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.90 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.44.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_organization_iam_binding.role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bindings"></a> [bindings](#input\_bindings) | Map of IAM roles with list of identities to grant the role on the organization. | `map(list(string))` | n/a | yes |
| <a name="input_editors"></a> [editors](#input\_editors) | Identities that will be granted the basic role `editor` on the organization | `list(string)` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The numeric ID of the organization in which you want to manage the IAM binding. | `string` | n/a | yes |
| <a name="input_owners"></a> [owners](#input\_owners) | Identities that will be granted the basic role `owner` on the organization | `list(string)` | n/a | yes |
| <a name="input_viewers"></a> [viewers](#input\_viewers) | Identities that will be granted the basic role `viewer` on the organization | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
