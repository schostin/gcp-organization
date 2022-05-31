locals {
  sandboxes = yamldecode(file("${path.module}/sandboxes.yaml")).sandboxes
}

module "sandbox_projects" {
  source = "./modules/sandbox-project"

  for_each = local.sandboxes

  organization_id                               = var.organization_id
  sandboxes_folder_id                           = var.sandboxes_folder_id
  shared_infrastructure_main_dns_project_id     = var.shared_infrastructure_main_dns_project_id
  shared_infrastructure_sandboxes_dns_zone_name = var.shared_infrastructure_sandboxes_dns_zone_name
  sandbox_owner                                 = each.value.sanbbox_owner_name
  sandbox_owner_email                           = each.value.sandbox_owner_mail_address
  sandbox_billing_account_id                    = each.value.billing_account_id
  sandbox_additional_owners                     = each.value.additional_owners
}
