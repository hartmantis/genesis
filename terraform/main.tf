module "kubernetes_cluster" {
  source             = "./modules/kubernetes_cluster"
  digitalocean_token = var.digitalocean_token
  name               = "jdh"
  region             = "sfo2"
}
