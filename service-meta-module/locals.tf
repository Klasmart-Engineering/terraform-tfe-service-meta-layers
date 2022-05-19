locals {
  # Secret names
  tfe_organization_name     = var.tfe_organization_name

  tfe_tags = [
    "own:${lower(var.service_owner)}",
  ]
  working_directory = var.working_directory
}

locals {
  readme_kidskube_meta = <<EOT
KidsKube Service meta layer resources.
This module includes the following:
- Terraform Cloud (TFC) workspaces for (micro) services
EOT
}
