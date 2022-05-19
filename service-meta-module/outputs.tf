output "tfe_workspace_service_meta_id" {
  description = "ID of the meta tfe workspace"
  value       = tfe_workspace.service-meta.id
}
output "region" {
  description = "Cloud provider region for this deployment"
  value       = var.region
}
output "project_environment" {
  description = "Shorthand name of the environment (e.g. prod, stage, dev...)"
  value       = var.project_environment
}
output "project_region" {
  description = "Two letter country code for the market which this environment serves (e.g. kr / lk / in etc..)"
  value       = var.project_region
}
output "service_owner" {
  description = "Name of the team who owns and manages this deployment."
  value       = var.service_owner
}
output "domain" {
  description = "Name of the domain where this deployment will be hosted."
  value       = var.domain
}
output "working_directory" {
  description = "Directory name for the Terraform code."
  value       = local.working_directory
}
