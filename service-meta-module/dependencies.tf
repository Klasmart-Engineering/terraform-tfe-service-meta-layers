data "tfe_ssh_key" "deploy" {
  name         = var.tfe_deploy_ssh_key_id
  organization = local.tfe_organization_name
}
