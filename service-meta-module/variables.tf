# Basic project variables

variable "workspace_name" {
  description = "The name of the workspace to be created"
  type = string
}

variable "service_owner" {
  description = "Owner of deployment (which team manages?)"
  type        = string
}

variable "tags" {
  description = "Set of tags to apply to all resources"
  type        = map(any)
  default     = {}
}

# TFC variables
variable "terraform_version" {
  description = "Version of terraform to set up workspaces with"
  type        = string
  default     = "1.1.7"
}

variable "service_meta_repo" {
  description = "The repo containing the meta configuration for a service"
  type        = string
}

variable "tfe_deploy_ssh_key_id" {
  description = "Name of the SSH key to authenticate with for Git-SSH based service module imports"
  type        = string
  default     = "TFC GitHub"
}

variable "vcs_oauth_token_id" {
  description = "ID of the VCS OAuth token to use for configuring git-trigger automated updates"
  type        = string
  default     = "ot-d4J8jBXB89U1bwzw"
}

variable "working_directory" {
  description = "The location of the terraform files for the environment"
  type        = string
}

variable "tfe_team_access_permissions" {
  description = "Map of team names to permissions levels for the teams who are allowed access to workspaces for this environment."
  type        = map
  default     = {
    "Infrastructure" = "admin"
  }
}

variable "tfe_organization_name" {
  description = "Name of the Terraform Cloud org"
  type        = string
  default     = "kidsloop-infrastructure"
}

# Notification settings
variable "notify_name" {
  description = "Name of the Slack channel to notify to."
  type        = string
  default     = "infra-terraform-cloud"
}
variable "notify_enabled" {
  description = "If set, will enable notifications."
  type        = bool
  default     = false
}
variable "notify_triggers" {
  description = "List of triggers for which to generate notifications."
  type        = list(string)
  default     = [
    "run:created",
    "run:planning",
    "run:needs_attention",
    "run:applying",
    "run:completed",
    "run:errored"
  ]
}
variable "notify_url" {
  description = "Webhook URL to send the notification to."
  type        = string
  default     = "https://hooks.slack.com/services/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"
}
