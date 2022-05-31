remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = "sebastianneb-seed-terraform-state"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  organization_id                          = "341667633844"
  billing_account_id_shared_infrastructure = "012A37-911A41-9E7FAA"
  seed_project_id                          = "sebastianneb-seed-2022"
}
