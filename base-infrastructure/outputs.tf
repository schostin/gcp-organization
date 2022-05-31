output "domain" {
  value       = data.google_organization.sebastianneb.domain
  description = "The domain of the organization"
}

output "seed_project_number" {
  value       = data.google_project.seed_project.number
  description = "The project number of the seed project"
}

output "sandbox_folder_id" {
  value       = google_folder.sandboxes.id
  description = "The folder id of the sanbbox folder in the form 'folders/{id}'"
}

output "products_folder_id" {
  value       = google_folder.products.id
  description = "The folder id of the sanbbox folder in the form 'folders/{id}'"
}
output "shared_infrastructure_folder_id" {
  value       = google_folder.shared_infrastructure.id
  description = "The folder id of the sanbbox folder in the form 'folders/{id}'"
}

output "shared_infrastructure_main_dns_poroject_id" {
  value       = module.shared_infrastructure_dns_project.project_id
  description = "The project id of the created main DNS project"
}

output "shared_infrastructure_main_dns_servers" {
  value       = google_dns_managed_zone.main.name_servers
  description = "The name servers of the created DNS zone to be placed in the Record-set of the Domain registration"
}
