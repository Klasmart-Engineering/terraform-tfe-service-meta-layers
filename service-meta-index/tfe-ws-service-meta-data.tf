module "svc-ws-service-meta-data" {
  # Module import info here
  source  = "../service-meta-module"

  # Module inputs here
  service_owner       = "Infra"
  working_directory   = ""
  service_meta_repo   = "KL-Engineering/data-terraform-meta"

  # RBAC settings
  tfe_team_access_permissions = local.tfe_team_access_permissions
}
