terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.11"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.4"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.3"
    }
  }
}

provider "digitalocean" {
  token   = var.digitalocean_token
}

provider "kubernetes" {
  host                   = digitalocean_kubernetes_cluster.default.kube_config.0.host
  client_certificate     = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_certificate)
  client_key             = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = digitalocean_kubernetes_cluster.default.kube_config.0.host
    client_certificate     = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_certificate)
    client_key             = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
  }
}
