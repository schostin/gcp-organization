include "root" {
  path = find_in_parent_folders()
}

dependency "base_infrastructure" {
  config_path = "../base-infrastructure"
}

inputs = {
  shared_infrastructure_folder_id               = dependency.base_infrastructure.outputs.shared_infrastructure_folder_id
  sandboxes_folder_id                           = dependency.base_infrastructure.outputs.sandboxes_folder_id
  shared_infrastructure_main_dns_project_id     = dependency.base_infrastructure.outputs.shared_infrastructure_main_dns_project_id
  shared_infrastructure_sandboxes_dns_zone_name = dependency.base_infrastructure.outputs.shared_infrastructure_sandboxes_dns_zone.name
}
