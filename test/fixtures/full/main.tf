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

module "gcp_organization" {
  source = "../../../"

  billing_account = var.billing_account
  default_zone    = "europe-west1-b"
  org_id          = var.org_id

  cloud_identity_groups = {
    create_groups   = true
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
