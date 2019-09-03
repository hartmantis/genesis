module "kubernetes_cluster" {
  source             = "./modules/kubernetes_cluster"
  digitalocean_token = var.digitalocean_token
  name               = "jdh"
  region             = "sfo2"
  gandi_key          = var.gandi_key
  domain             = "yaml.zone"
}
