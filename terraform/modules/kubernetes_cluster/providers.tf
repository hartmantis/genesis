provider "digitalocean" {
  # TODO: Pending https://github.com/terraform-providers/terraform-provider-digitalocean/pull/289
  # version = ">= 1.7.1"
  version = "~> 1.7"
  token   = var.digitalocean_token
}

provider "kubernetes" {
  version                = "~> 1.9"
  load_config_file       = false
  host                   = digitalocean_kubernetes_cluster.default.kube_config.0.host
  client_certificate     = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_certificate)
  client_key             = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
}

provider "helm" {
  version         = "~> 0.10"
  tiller_image    = "gcr.io/kubernetes-helm/tiller:v2.14.3"
  service_account = "tiller"

  kubernetes {
    load_config_file       = false
    host                   = digitalocean_kubernetes_cluster.default.kube_config.0.host
    client_certificate     = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_certificate)
    client_key             = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
  }
}
