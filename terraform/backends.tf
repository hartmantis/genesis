terraform {
  backend "remote" {
    organization = "jdh"

    workspaces {
      name = "genesis"
    }
  }
}
