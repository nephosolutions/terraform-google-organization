# Copyright 2018-2022 NephoSolutions srl, Sebastian Trebitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "billing_account" {
  description = "The billing_account to which the projects should be attached to"
  type        = string
}

variable "cloud_identity_groups" {
  description = "Contains the details of the Cloud Identity groups to be created."

  type = object({
    create_groups   = bool
    billing_project = string
    required_groups = object({
      audit_viewers = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      billing_admins = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      billing_data_users = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      monitoring_admins = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      network_viewers = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      org_admins = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      platform_viewers = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      scc_admins = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      secrets_admins = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      security_admins = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
      security_reviewers = object({
        id           = string
        display_name = string
        description  = string
        owners       = list(string)
        managers     = list(string)
        members      = list(string)
      })
    })
  })

  default = {
    create_groups   = false
    billing_project = ""
    required_groups = {
      audit_viewers = {
        id           = "gcp-audit-viewers@example.com"
        display_name = "GCP Audit Viewers"
        description  = "Members are part of an audit team and view audit logs in the logging project."
        owners       = []
        managers     = []
        members      = []
      }
      billing_admins = {
        id           = "gcp-billing-admins@example.com"
        display_name = "GCP Billing Admins"
        description  = "Billing admins are responsible for setting up billing accounts and monitoring their usage."
        owners       = []
        managers     = []
        members      = []
      }
      billing_data_users = {
        id           = "gcp-billing-data-users@example.com"
        display_name = "GCP Billing Data Users"
        description  = "Members are authorized to view the spend on projects. Typical members are part of the finance team."
        owners       = []
        managers     = []
        members      = []
      }
      monitoring_admins = {
        id           = "gcp-monitoring-admins@example.com"
        display_name = "GCP Monitoring Admins"
        description  = "Members have access to Monitoring Workspaces."
        owners       = []
        managers     = []
        members      = []
      }
      network_viewers = {
        id           = "gcp-network-viewers@example.com"
        display_name = "GCP Network Viewers"
        description  = "Members are part of the networking team and review network configurations."
        owners       = []
        managers     = []
        members      = []
      }
      org_admins = {
        id           = "gcp-organization-admins@example.com"
        display_name = "GCP Organization Admins"
        description  = "Organization admins are responsible for organizing the structure of the resources used by the organization."
        owners       = []
        managers     = []
        members      = []
      }
      platform_viewers = {
        id           = "gcp-platform-viewers@example.com"
        display_name = "GCP Platform Viewers"
        description  = "Members have the ability to view resource information across the Google Cloud organization."
        owners       = []
        managers     = []
        members      = []
      }
      scc_admins = {
        id           = "gcp-scc-admins@example.com"
        display_name = "GCP Security Command Center Admins"
        description  = "Members can administer Security Command Center."
        owners       = []
        managers     = []
        members      = []
      }
      secrets_admins = {
        id           = "gcp-secrets-admins@example.com"
        display_name = "GCP Secrets Manager Secrets Admins"
        description  = "Members are responsible for putting secrets into Secrets Manager."
        owners       = []
        managers     = []
        members      = []
      }
      security_admins = {
        id           = "gcp-security-admins@example.com"
        display_name = "GCP Security Admins"
        description  = "Security admins are responsible for establishing and managing security policies for the entire organization, including access management and organization constraint policies."
        owners       = []
        managers     = []
        members      = []
      }
      security_reviewers = {
        id           = "gcp-security-reviewers@example.com"
        display_name = "GCP Security Reviewers"
        description  = "Members are part of the security team responsible for reviewing cloud security."
        owners       = []
        managers     = []
        members      = []
      }
    }
  }
}

variable "default_zone" {
  description = "The zone within a region used by default to create new resources"
  type        = string
}

variable "editors" {
  description = "Identities that will be granted the basic role `editor` on the organization"
  type        = list(string)
}

variable "essential_contacts_language" {
  description = "Essential Contacts preferred language for notifications, as a ISO 639-1 language code. See [Supported languages](https://cloud.google.com/resource-manager/docs/managing-notification-contacts#supported-languages) for a list of supported languages."
  type        = string
  default     = "en"
}

variable "iam_audit_config" {
  description = "Map of service APIs which will be enabled for audit logging, with a map of audit log types for which logging is to be configured, with an map of optional attributes including a list of identities that do not cause logging. [google_folder_iam_audit_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder_iam#google_folder_iam_audit_config)"

  type = map(map(object({
    exempted_members = list(string)
  })))

  default = {}
}

variable "iam_bindings" {
  description = "Updates the IAM policy to grant a role exclusively to the list of members."
  type        = map(list(string))
  default     = {}
}

variable "iam_memberships" {
  description = "Updates the IAM policy to grant a role to a list of members. Non-authoritative for a given role."
  type        = map(list(string))
  default     = {}
}

variable "org_id" {
  description = "The numeric ID of the Google Cloud organization."
  type        = string
}

variable "owners" {
  description = "Identities that will be granted the basic role `owner` on the organization"
  type        = list(string)
}

variable "viewers" {
  description = "Identities that will be granted the basic role `viewer` on the organization"
  type        = list(string)
}
