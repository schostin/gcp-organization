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
  organization_id = "341667633844"
}
