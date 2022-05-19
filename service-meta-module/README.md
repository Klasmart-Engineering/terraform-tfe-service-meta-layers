# Terraform Cloud Workspaces

## Description

This is automation to control creation of the Terraform Cloud workspaces for deploying shared tooling internal applications.

## Caveats

* Workspaces will be created with VCS deployment triggers. By default these triggers create plans automatically but do not execute them straight away.
* Workspaces are created with role-based access control, based on the `tfe_team_access_permissions` permissions map. Map keys should match the human readable team name exactly. Map values should be set to either one of [`read`, `plan`, `write` or `admin`]. All created workspaces get exactly the same permissions.
* The created workspace always takes the naming convention `meta-<working_directory>`, where `<working_directory>` is the name of the directory where the Terraform code lives for this particular deployment (e.g. `uk-prod`, `kidskube-dev` or `stage`). The advantage is that all env repos can infer the name of their associated "meta-workspace" without any external inputs, just by using the name of the current directory - `meta-${basename(abspath("."))}`.

## Auto docs

This project uses automatic documentation from `terraform-docs`.

To update the documentation, run this command from inside the project repo:

```bash
terraform-docs markdown table --output-file README.md .
```

To install `terraform-docs` on MacOS, run this command:

```bash
brew install terraform-docs
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.30.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | >= 0.30.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_notification_configuration.meta](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/notification_configuration) | resource |
| [tfe_team_access.meta](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_access) | resource |
| [tfe_workspace.meta](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_ssh_key.deploy](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/ssh_key) | data source |
| [tfe_team.team_name_id_lookup](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name of environment (e.g. stage.kidsloop.live) | `string` | n/a | yes |
| <a name="input_notify_enabled"></a> [notify\_enabled](#input\_notify\_enabled) | If set, will enable notifications. | `bool` | `true` | no |
| <a name="input_notify_name"></a> [notify\_name](#input\_notify\_name) | Name of the Slack channel to notify to. | `string` | `"infra-terraform-cloud"` | no |
| <a name="input_notify_triggers"></a> [notify\_triggers](#input\_notify\_triggers) | List of triggers for which to generate notifications. | `list(string)` | <pre>[<br>  "run:created",<br>  "run:planning",<br>  "run:needs_attention",<br>  "run:applying",<br>  "run:completed",<br>  "run:errored"<br>]</pre> | no |
| <a name="input_notify_url"></a> [notify\_url](#input\_notify\_url) | Webhook URL to send the notification to. | `string` | `"https://hooks.slack.com/services/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"` | no |
| <a name="input_project_environment"></a> [project\_environment](#input\_project\_environment) | Business name of Kidsloop environment (e.g. test) | `string` | n/a | yes |
| <a name="input_project_region"></a> [project\_region](#input\_project\_region) | Business name of Kidsloop region (e.g. uk/in/id/vn etc) | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Cloud provider region name | `string` | n/a | yes |
| <a name="input_service_owner"></a> [service\_owner](#input\_service\_owner) | Owner of deployment (which team manages?) | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Set of tags to apply to all resources | `map(any)` | `{}` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Version of terraform to set up workspaces with | `string` | `"1.1.7"` | no |
| <a name="input_tfe_deploy_ssh_key_id"></a> [tfe\_deploy\_ssh\_key\_id](#input\_tfe\_deploy\_ssh\_key\_id) | Name of the SSH key to authenticate with for Git-SSH based service module imports | `string` | `"TFC GitHub"` | no |
| <a name="input_tfe_organization_name"></a> [tfe\_organization\_name](#input\_tfe\_organization\_name) | Name of the Terraform Cloud org | `string` | `"kidsloop-infrastructure"` | no |
| <a name="input_tfe_team_access_permissions"></a> [tfe\_team\_access\_permissions](#input\_tfe\_team\_access\_permissions) | Map of team names to permissions levels for the teams who are allowed access to workspaces for this environment. | `map` | <pre>{<br>  "Infrastructure": "admin"<br>}</pre> | no |
| <a name="input_vcs_oauth_token_id"></a> [vcs\_oauth\_token\_id](#input\_vcs\_oauth\_token\_id) | ID of the VCS OAuth token to use for configuring git-trigger automated updates | `string` | `"ot-Ga8vDZ6geXQzUnRH"` | no |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | The location of the terraform files for the environment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain"></a> [domain](#output\_domain) | Name of the domain where this deployment will be hosted. |
| <a name="output_project_environment"></a> [project\_environment](#output\_project\_environment) | Shorthand name of the environment (e.g. prod, stage, dev...) |
| <a name="output_project_region"></a> [project\_region](#output\_project\_region) | Two letter country code for the market which this environment serves (e.g. kr / lk / in etc..) |
| <a name="output_region"></a> [region](#output\_region) | Cloud provider region for this deployment |
| <a name="output_service_owner"></a> [service\_owner](#output\_service\_owner) | Name of the team who owns and manages this deployment. |
| <a name="output_tfe_workspace_meta_id"></a> [tfe\_workspace\_meta\_id](#output\_tfe\_workspace\_meta\_id) | ID of the meta tfe workspace |
| <a name="output_working_directory"></a> [working\_directory](#output\_working\_directory) | Directory name for the Terraform code. |
<!-- END_TF_DOCS -->