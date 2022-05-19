output "tfe_workspace_service_meta_id" {
  description = "ID of the meta tfe workspace"
  value       = tfe_workspace.service-meta.id
}

output "service_owner" {
  description = "Name of the team who owns and manages this deployment."
  value       = var.service_owner
}

output "working_directory" {
  description = "Directory name for the Terraform code."
  value       = local.working_directory
}
