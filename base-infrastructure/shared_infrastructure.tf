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

locals {
  dns_zone_name = replace(data.google_organization.sebastianneb.domain, ".", "-")
}

resource "google_dns_managed_zone" "main" {
  project     = module.shared_infrastructure_dns_project.project_id
  name        = local.dns_zone_name
  dns_name    = "${data.google_organization.sebastianneb.domain}."
  description = "Main DNS Zone"
}

resource "google_dns_managed_zone" "sandboxes" {
  project     = module.shared_infrastructure_dns_project.project_id
  name        = "sandboxes-${local.dns_zone_name}"
  dns_name    = "sandboxes.${google_dns_managed_zone.main.dns_name}"
  description = "Sandboxes DNS Zone"
}

resource "google_dns_record_set" "sandboxes" {
  project = module.shared_infrastructure_dns_project.project_id
  name    = google_dns_managed_zone.sandboxes.dns_name
  type    = "NS"
  ttl     = 3600

  managed_zone = google_dns_managed_zone.main.name

  rrdatas = google_dns_managed_zone.sandboxes.name_servers
}
