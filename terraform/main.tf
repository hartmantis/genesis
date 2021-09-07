terraform {
  required_version = "= 1.0.6"
}

module "kubernetes_cluster" {
  source             = "./modules/kubernetes_cluster"
  digitalocean_token = var.digitalocean_token
  name               = "jdh"
  region             = "sfo2"
  domain             = "yaml.zone"
}
