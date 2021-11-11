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
  default     = "1.21.5-do.0"
}
variable "node_count" {
  description = "The number of nodes in the default node pool"
  default     = 3
}
variable "node_size" {
  description = "The size of nodes in the default node pool"
  default     = "s-1vcpu-2gb"
}
variable "domain" {
  description = "The domain name to use with our ingress controller"
}
