variable "organization_id" {
  type        = string
  description = "The organization id of the organization"
}

variable "sandboxes_folder_id" {
  type       = string
  description = "The folder id of the sanbbox folder in the form 'folders/{id}'"
}

variable "shared_infrastructure_main_dns_project_id" {
  type        = string
  description = "The project id of the main dns project that holds the main dns zones"
}

variable "shared_infrastructure_sandboxes_dns_zone_name" {
  type        = string
  description = "The name of the sandbox managed dns zone"
}

variable "sandbox_owner" {
  type        = string
  description = "The name of the sandbox owner. The name will be inferred."
}

variable "sandbox_owner_email" {
  type        = string
  description = "The owner of the sandbox"
}

variable "sandbox_billing_account_id" {
  type        = string
  description = "The billing account id to be used for the sandbox"
}

variable "sandbox_additional_owners" {
  type        = list(string)
  description = "Additional mail addresses of owners for the sandbox"
}
