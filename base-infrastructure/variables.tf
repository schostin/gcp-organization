variable "organization_id" {
  type        = string
  description = "The organization id of the organization"
}

variable "seed_project_id" {
  type = string
  description = "The ID of the seed project needed for further creation of service accounts"
}

variable "billing_account_id_shared_infrastructure" {
  type        = string
  description = "The billing account id to be used for the shared infrastructure"
}
