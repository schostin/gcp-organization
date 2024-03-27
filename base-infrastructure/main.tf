terraform {
  required_version = "1.7.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.22.0"
    }
  }
}

data "google_organization" "sebastianneb" {
  organization = var.organization_id
}

data "google_project" "seed_project" {
  project_id = var.seed_project_id
}
