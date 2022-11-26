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

locals {
  cloud_identity_groups = {
    for key, value in var.cloud_identity_groups.required_groups : key => value
    if var.cloud_identity_groups.create_groups == true
  }

  group_audit_viewers      = var.cloud_identity_groups.required_groups.audit_viewers.id
  group_billing_admins     = var.cloud_identity_groups.required_groups.billing_admins.id
  group_billing_data_users = var.cloud_identity_groups.required_groups.billing_data_users.id
  group_network_viewers    = var.cloud_identity_groups.required_groups.network_viewers.id
  group_org_admins         = var.cloud_identity_groups.required_groups.org_admins.id
  group_platform_viewers   = var.cloud_identity_groups.required_groups.platform_viewers.id
  group_scc_admins         = var.cloud_identity_groups.required_groups.scc_admins.id
  group_security_reviewers = var.cloud_identity_groups.required_groups.security_reviewers.id
}

module "cloud_identity_group" {
  for_each = local.cloud_identity_groups
  source   = "terraform-google-modules/group/google"
  version  = "~> 0.4"

  id           = each.value["id"]
  display_name = each.value["display_name"]
  description  = each.value["description"]
  customer_id  = data.google_organization.org.directory_customer_id
  owners       = each.value["owners"]
  managers     = each.value["managers"]
  members      = each.value["members"]
}
