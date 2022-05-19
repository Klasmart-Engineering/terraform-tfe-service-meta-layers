terraform {
  cloud {
    organization = "kidsloop-infrastructure"
    workspaces {
      name = "service-meta-index"
    }
  }
}
