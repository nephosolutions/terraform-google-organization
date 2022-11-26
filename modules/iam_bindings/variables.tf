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

variable "bindings" {
  description = "Map of IAM roles with list of identities to grant the role on the organization."
  type        = map(list(string))
}

variable "editors" {
  description = "Identities that will be granted the basic role `editor` on the organization"
  type        = list(string)
}

variable "org_id" {
  description = "The numeric ID of the organization in which you want to manage the IAM binding."
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
