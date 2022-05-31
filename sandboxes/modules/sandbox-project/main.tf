terraform {
  required_version = "~> 1.2.1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.22.0"
    }
  }
}


locals {
  sandbox_owner_name           = trimspace(replace(lower(var.sandbox_owner), " ", "-"))
  trimmed_sandbox_project_name = substr("sandbox-${local.sandbox_owner_name}", 0, 25)
}

module "sandbox_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "13.0.0"

  name              = local.trimmed_sandbox_project_name
  random_project_id = true
  folder_id         = var.sandboxes_folder_id
  org_id            = var.organization_id
  billing_account   = var.sandbox_billing_account_id

  auto_create_network     = false
  create_project_sa       = false
  default_service_account = "delete"

  # The owner of the sandbox can activate more APIs if needed
  activate_apis = [
    "iam.googleapis.com",
    "dns.googleapis.com"
  ]
}

data "google_dns_managed_zone" "sandbox_zone" {
  project = var.shared_infrastructure_main_dns_project_id
  name    = var.shared_infrastructure_sandboxes_dns_zone_name
}

resource "google_dns_managed_zone" "sandboxes" {
  project     = module.sandbox_project.project_id
  name        = "sandbox-${local.sandbox_owner_name}"
  dns_name    = "${local.sandbox_owner_name}.${data.google_dns_managed_zone.sandbox_zone.dns_name}"
  description = "Sandbox for owner ${var.sandbox_owner} DNS Zone"
}

resource "google_dns_record_set" "sandboxes" {
  project = var.shared_infrastructure_main_dns_project_id
  name    = google_dns_managed_zone.sandboxes.dns_name
  type    = "NS"
  ttl     = 3600

  managed_zone = var.shared_infrastructure_sandboxes_dns_zone_name

  rrdatas = google_dns_managed_zone.sandboxes.name_servers
}

resource "google_project_iam_member" "owner" {
  project = module.sandbox_project.project_id
  role    = "roles/owner"
  member  = "user:${var.sandbox_owner_email}"
}
