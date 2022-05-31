variable "organization_id" {
  type        = string
  description = "The organization id of the organization"
}

variable "sandboxes_folder_id" {
  type        = string
  description = "The folder id of the sandbox folder in the form 'folders/{id}'"
}

variable "shared_infrastructure_main_dns_project_id" {
  type        = string
  description = "The project id of the main dns project that holds the main dns zones"
}

variable "shared_infrastructure_sandboxes_dns_zone_name" {
  type        = string
  description = "The name of the sandbox managed dns zone"
}
