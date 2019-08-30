resource "digitalocean_kubernetes_cluster" "default" {
  name    = var.name
  region  = var.region
  version = var.kubernetes_version

  node_pool {
    name       = "default"
    size       = var.node_size
    node_count = var.node_count
  }
}
