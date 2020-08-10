terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 1.22"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.12"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 1.2"
    }
  }
}

provider "digitalocean" {
  token   = var.digitalocean_token
}

provider "kubernetes" {
  load_config_file       = false
  host                   = digitalocean_kubernetes_cluster.default.kube_config.0.host
  client_certificate     = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_certificate)
  client_key             = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    load_config_file       = false
    host                   = digitalocean_kubernetes_cluster.default.kube_config.0.host
    client_certificate     = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_certificate)
    client_key             = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
  }
}
