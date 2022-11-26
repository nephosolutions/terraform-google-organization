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

data "google_organization" "org" {
  organization = var.org_id
}

module "audit_config" {
  source   = "./modules/audit_config"
  for_each = var.iam_audit_config

  org_id           = var.org_id
  service          = each.key
  audit_log_config = each.value
}

module "bootstrap_project" {
  source  = "nephosolutions/gcp-project/google"
  version = "~> 6.1.0"

  billing_account = var.billing_account
  default_zone    = var.default_zone
  labels          = {}
  org_id          = var.org_id
  project_id      = "gcp-organization"
  project_name    = "Google Cloud Organization"
}

module "iam_bindings" {
  source = "./modules/iam_bindings"

  org_id   = var.org_id
  bindings = var.iam_bindings
  editors  = var.editors
  owners   = var.owners
  viewers  = var.viewers
}

module "iam_memberships" {
  source   = "./modules/iam_memberships"
  for_each = var.iam_memberships

  org_id  = var.org_id
  role    = each.key
  members = each.value
}
