# Google Cloud Project IAM members Terraform module

Non-authoritative.
Updates the IAM policy of the organization to grant a role to a new member.
Other members for the role on the organization are preserved.

## Usage

```hcl
module "iam_memberships" {
  source  = "nephosolutions/organization/google//modules/iam_memberships"
  version = "~> 1.0.0"

  org_id  = "0123456789123"
  role       = "roles/compute.admin"

  members = [
    "user:foobar@example.com"
  ]
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
| [google_organization_iam_member.identity](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_members"></a> [members](#input\_members) | List of identities that will be granted the privilege in `role`. | `list(string)` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The numeric ID of the organization in which you want to manage the IAM binding. | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | The role that should be applied. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
