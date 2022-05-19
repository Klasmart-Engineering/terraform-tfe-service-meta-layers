resource "tfe_workspace" "service-meta" {
  name               = "service-meta-${local.working_directory}"
  organization       = local.tfe_organization_name
  execution_mode     = "remote"
  description        = local.readme_kidskube_meta
  tag_names          = concat(["lay:meta"], local.tfe_tags)
  terraform_version  = var.terraform_version
  allow_destroy_plan = false

  # Deploy settings
  ssh_key_id         = data.tfe_ssh_key.deploy.id
  working_directory  = local.working_directory
  vcs_repo {
    identifier   = var.service_meta_repo
    branch       = "main"
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_token_id
  }
}
resource "tfe_team_access" "meta" {
  for_each     = var.tfe_team_access_permissions

  workspace_id = tfe_workspace.service-meta.id
  team_id      = data.tfe_team.team_name_id_lookup[each.key].id
  access       = each.value
}
