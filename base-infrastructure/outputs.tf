output "domain" {
  value       = data.google_organization.sebastianneb.domain
  description = "The domain of the organization"
}

output "seed_project_number" {
  value       = data.google_project.seed_project.number
  description = "The project number of the seed project"
}

output "sandboxes_folder_id" {
  value       = google_folder.sandboxes.id
  description = "The folder id of the sandbox folder in the form 'folders/{id}'"
}

output "products_folder_id" {
  value       = google_folder.products.id
  description = "The folder id of the products folder in the form 'folders/{id}'"
}
output "shared_infrastructure_folder_id" {
  value       = google_folder.shared_infrastructure.id
  description = "The folder id of the shared infrastructure folder in the form 'folders/{id}'"
}

output "shared_infrastructure_main_dns_project_id" {
  value       = module.shared_infrastructure_dns_project.project_id
  description = "The project id of the main dns project that holds the main dns zones"
}

output "shared_infrastructure_main_dns_zone" {
  value = {
    id           = google_dns_managed_zone.main.id
    name         = google_dns_managed_zone.main.name
    name_servers = google_dns_managed_zone.main.name_servers
  }
  description = "The properties of the main dns zone"
}

output "shared_infrastructure_sandboxes_dns_zone" {
  value = {
    id           = google_dns_managed_zone.sandboxes.id
    name         = google_dns_managed_zone.sandboxes.name
    name_servers = google_dns_managed_zone.sandboxes.name_servers
  }
  description = "The properties of the sandboxes sub-dns zone"
}
