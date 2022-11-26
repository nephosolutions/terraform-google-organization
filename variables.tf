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
  description = "the billing_account to which the project should be attached to"
  type        = string
}

variable "default_zone" {
  description = "The zone within a region used by default to create new resources"
  type        = string
}

variable "editors" {
  description = "Identities that will be granted the basic role `editor` on the organization"
  type        = list(string)
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
