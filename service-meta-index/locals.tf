locals {
  tfe_organization = "kidsloop-infrastructure"

  # Workspace ID of the main "service-meta-index" workspace
  service_meta_index_workspace_id = "ws-PvpdRjfzvqiQDTYe"

  # RBAC settings
  tfe_team_access_permissions = {
    "Infrastructure" = "admin"
  }

  # Notification settings
  notify_triggers = ["run:needs_attention", "run:applying", "run:completed", "run:errored"]
}
