module "shared_infrastructure_dns_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "13.0.0"

  name              = "main-dns"
  random_project_id = true
  folder_id         = google_folder.shared_infrastructure.folder_id
  org_id            = var.organization_id
  billing_account   = var.billing_account_id_shared_infrastructure

  auto_create_network     = false
  create_project_sa       = false
  default_service_account = "delete"
  lien                    = true

  activate_apis = [
    "iam.googleapis.com",
    "dns.googleapis.com"
  ]
}

resource "google_dns_managed_zone" "main" {
  project     = module.shared_infrastructure_dns_project.project_id
  name        = replace(data.google_organization.sebastianneb.domain, ".", "-")
  dns_name    = "${data.google_organization.sebastianneb.domain}."
  description = "Main DNS Zone"
}
