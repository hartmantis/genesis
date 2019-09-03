variable "digitalocean_token" {
  description = "DigitalOcean API token"
}
variable "name" {
  description = "The cluster name"
}
variable "region" {
  description = "The cluster region in DigitalOcean"
}
# The "version" variable name is reserved in modules.
variable "kubernetes_version" {
  description = "The Kubernetes version"
  default     = "1.15.3-do.1"
}
variable "node_count" {
  description = "The number of nodes in the default node pool"
  default     = 3
}
variable "node_size" {
  description = "The size of nodes in the default node pool"
  default     = "s-1vcpu-2gb"
}
variable "istio_version" {
  description = "The version of Istio to install"
  default     = "1.3.0-rc.1"
}
variable "gandi_key" {
  description = "Gandi.net API key"
}
variable "domain" {
  description = "A domain to give a wildcard DNS record pointed at Kubernetes' load balancer"
}
