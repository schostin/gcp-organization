resource "google_folder" "sandboxes" {
  display_name = "Sandboxes"
  parent       = "organizations/${var.organization_id}"
}

resource "google_folder" "products" {
  display_name = "Products"
  parent       = "organizations/${var.organization_id}"
}

resource "google_folder" "shared_infrastructure" {
  display_name = "Shared Infrastructure"
  parent       = "organizations/${var.organization_id}"
}
