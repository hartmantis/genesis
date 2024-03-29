terraform {
  required_version = "= 1.1.7"
}

module "kubernetes_cluster" {
  source             = "./modules/kubernetes_cluster"
  digitalocean_token = var.digitalocean_token
  name               = "jdh"
  region             = "sfo2"
  domain             = "yaml.zone"
}
