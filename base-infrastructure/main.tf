terraform {
  required_version = "~> 1.2.1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.22.0"
    }
  }
}

data "google_organization" "sebastianneb" {
  organization = var.organization_id
}
