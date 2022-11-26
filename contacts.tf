# SKIP LICENSE INSERTION

# Copyright 2022 NephoSolutions srl, Sebastian Trebitz
# Copyright 2022 Google LLC
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
  # Notification categories details: https://cloud.google.com/resource-manager/docs/managing-notification-contacts#notification-categories
  categories_map = {
    "BILLING"         = [local.group_billing_admins, local.group_billing_data_users]
    "LEGAL"           = [local.group_org_admins, local.group_audit_viewers]
    "PRODUCT_UPDATES" = [local.group_scc_admins, local.group_platform_viewers]
    "SECURITY"        = [local.group_scc_admins, local.group_security_reviewers]
    "SUSPENSION"      = [local.group_org_admins]
    "TECHNICAL"       = [local.group_platform_viewers, local.group_security_reviewers, local.group_network_viewers]
  }

  # Convert a map indexed by category to a map indexed by email
  # this way is simpler to understand and maintain than the opposite
  # google_essential_contacts_contact resource needs one email with a list of categories
  contacts_list = transpose(local.categories_map)
}

resource "google_essential_contacts_contact" "essential_contact" {
  for_each = local.contacts_list

  parent                              = data.google_organization.org.id
  email                               = each.key
  language_tag                        = var.essential_contacts_language
  notification_category_subscriptions = each.value
}
