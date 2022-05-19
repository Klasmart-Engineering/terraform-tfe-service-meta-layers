module "svc-ws-service-meta-data" {
  # Module import info here
  source  = "../service-meta-module"

  # Module inputs here
  region              = "eu-west-2"
  project_environment = "apifactory"
  project_region      = "uk"
  service_owner       = "Infra"

  domain              = "apifactory.kidsloop.live"
  working_directory   = "data"

  # RBAC settings
  tfe_team_access_permissions = local.tfe_team_access_permissions
  # Notification settings
  notify_triggers = false
}
