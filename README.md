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

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.44.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_audit_config"></a> [audit\_config](#module\_audit\_config) | ./modules/audit_config | n/a |
| <a name="module_bootstrap_project"></a> [bootstrap\_project](#module\_bootstrap\_project) | nephosolutions/gcp-project/google | ~> 6.1.0 |
| <a name="module_cloud_identity_group"></a> [cloud\_identity\_group](#module\_cloud\_identity\_group) | terraform-google-modules/group/google | ~> 0.4 |
| <a name="module_iam_bindings"></a> [iam\_bindings](#module\_iam\_bindings) | ./modules/iam_bindings | n/a |
| <a name="module_iam_memberships"></a> [iam\_memberships](#module\_iam\_memberships) | ./modules/iam_memberships | n/a |

## Resources

| Name | Type |
|------|------|
| [google_essential_contacts_contact.essential_contact](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/essential_contacts_contact) | resource |
| [google_organization.org](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing\_account to which the projects should be attached to | `string` | n/a | yes |
| <a name="input_cloud_identity_groups"></a> [cloud\_identity\_groups](#input\_cloud\_identity\_groups) | Contains the details of the Cloud Identity groups to be created. | <pre>object({<br>    create_groups   = bool<br>    billing_project = string<br>    required_groups = object({<br>      audit_viewers = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      billing_admins = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      billing_data_users = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      monitoring_admins = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      network_viewers = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      org_admins = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      platform_viewers = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      scc_admins = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      secrets_admins = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      security_admins = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>      security_reviewers = object({<br>        id           = string<br>        display_name = string<br>        description  = string<br>        owners       = list(string)<br>        managers     = list(string)<br>        members      = list(string)<br>      })<br>    })<br>  })</pre> | <pre>{<br>  "billing_project": "",<br>  "create_groups": false,<br>  "required_groups": {<br>    "audit_viewers": {<br>      "description": "Members are part of an audit team and view audit logs in the logging project.",<br>      "display_name": "GCP Audit Viewers",<br>      "id": "gcp-audit-viewers@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "billing_admins": {<br>      "description": "Billing admins are responsible for setting up billing accounts and monitoring their usage.",<br>      "display_name": "GCP Billing Admins",<br>      "id": "gcp-billing-admins@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "billing_data_users": {<br>      "description": "Members are authorized to view the spend on projects. Typical members are part of the finance team.",<br>      "display_name": "GCP Billing Data Users",<br>      "id": "gcp-billing-data-users@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "monitoring_admins": {<br>      "description": "Members have access to Monitoring Workspaces.",<br>      "display_name": "GCP Monitoring Admins",<br>      "id": "gcp-monitoring-admins@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "network_viewers": {<br>      "description": "Members are part of the networking team and review network configurations.",<br>      "display_name": "GCP Network Viewers",<br>      "id": "gcp-network-viewers@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "org_admins": {<br>      "description": "Organization admins are responsible for organizing the structure of the resources used by the organization.",<br>      "display_name": "GCP Organization Admins",<br>      "id": "gcp-organization-admins@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "platform_viewers": {<br>      "description": "Members have the ability to view resource information across the Google Cloud organization.",<br>      "display_name": "GCP Platform Viewers",<br>      "id": "gcp-platform-viewers@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "scc_admins": {<br>      "description": "Members can administer Security Command Center.",<br>      "display_name": "GCP Security Command Center Admins",<br>      "id": "gcp-scc-admins@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "secrets_admins": {<br>      "description": "Members are responsible for putting secrets into Secrets Manager.",<br>      "display_name": "GCP Secrets Manager Secrets Admins",<br>      "id": "gcp-secrets-admins@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "security_admins": {<br>      "description": "Security admins are responsible for establishing and managing security policies for the entire organization, including access management and organization constraint policies.",<br>      "display_name": "GCP Security Admins",<br>      "id": "gcp-security-admins@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    },<br>    "security_reviewers": {<br>      "description": "Members are part of the security team responsible for reviewing cloud security.",<br>      "display_name": "GCP Security Reviewers",<br>      "id": "gcp-security-reviewers@example.com",<br>      "managers": [],<br>      "members": [],<br>      "owners": []<br>    }<br>  }<br>}</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | The zone within a region used by default to create new resources | `string` | n/a | yes |
| <a name="input_editors"></a> [editors](#input\_editors) | Identities that will be granted the basic role `editor` on the organization | `list(string)` | n/a | yes |
| <a name="input_essential_contacts_language"></a> [essential\_contacts\_language](#input\_essential\_contacts\_language) | Essential Contacts preferred language for notifications, as a ISO 639-1 language code. See [Supported languages](https://cloud.google.com/resource-manager/docs/managing-notification-contacts#supported-languages) for a list of supported languages. | `string` | `"en"` | no |
| <a name="input_iam_audit_config"></a> [iam\_audit\_config](#input\_iam\_audit\_config) | Map of service APIs which will be enabled for audit logging, with a map of audit log types for which logging is to be configured, with an map of optional attributes including a list of identities that do not cause logging. [google\_folder\_iam\_audit\_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder_iam#google_folder_iam_audit_config) | <pre>map(map(object({<br>    exempted_members = list(string)<br>  })))</pre> | `{}` | no |
| <a name="input_iam_bindings"></a> [iam\_bindings](#input\_iam\_bindings) | Updates the IAM policy to grant a role exclusively to the list of members. | `map(list(string))` | `{}` | no |
| <a name="input_iam_memberships"></a> [iam\_memberships](#input\_iam\_memberships) | Updates the IAM policy to grant a role to a list of members. Non-authoritative for a given role. | `map(list(string))` | `{}` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The numeric ID of the Google Cloud organization. | `string` | n/a | yes |
| <a name="input_owners"></a> [owners](#input\_owners) | Identities that will be granted the basic role `owner` on the organization | `list(string)` | n/a | yes |
| <a name="input_viewers"></a> [viewers](#input\_viewers) | Identities that will be granted the basic role `viewer` on the organization | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bootstrap_project_id"></a> [bootstrap\_project\_id](#output\_bootstrap\_project\_id) | Project where service accounts and core APIs will be enabled. |
| <a name="output_cloud_identity_groups"></a> [cloud\_identity\_groups](#output\_cloud\_identity\_groups) | Map of Google Cloud Identity groups created. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
