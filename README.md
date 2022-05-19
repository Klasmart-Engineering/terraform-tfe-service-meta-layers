# Meta-index project

This is the working area for the meta-index project.

The purpose of this meta-index project is to create and manage meta-workspaces for the various projects, those meta-workspaces are themselves used to create and manage workspaces for all of the different microservices within a project.

## Workspace hierachy

* meta-index workspace (only one single workspace within the Terraform Cloud organization)
    This workspace manages the "meta" workspaces for all projects. To add a new environment, you will need to create a new "meta" workspace for that environment in the `meta-index` workspace first of all. This is as simple as creating a new instance of the `svc-ws-meta` module in the `meta-index` folder.

* "meta" workspaces (one workspace per-project/per-deployment)
    These workspaces are intended for bootstrapping all of the workspaces needed to deploy and manage an entire Kidsloop environment. Because of the design choice to isolate resources per-microservice we need to have a Terraform Cloud workspace per-microservice. The "meta" workspace is used to organize all of these workspaces and their associated resources as desired.

* Regular workspaces (one workspace per-project and per-microservice)
    These are the actual workspaces that are used to store and manage resources for the individual microservices, and are allocated on a per-project and per-microservice (or per-layer if foundation group) basis.
