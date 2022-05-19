# resource "tfe_variable_set" "tfe-ws-token-service" {
#   name          = "tfe-ws-token-service"
#   description   = "This variable set contains a Terraform Cloud token for self-configuration of workspaces in the \"services-meta\" projects."
#   organization  = local.tfe_organization
#   workspace_ids = [
#     local.service_meta_index_workspace_id,
#   ]
# }
