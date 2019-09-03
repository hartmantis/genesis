data "kubernetes_service" "istio_ingressgateway" {
  depends_on = [helm_release.istio]
  metadata {
    name = "istio-ingressgateway"
    namespace = "istio-system"
  }
}

resource "gandi_zone" "default" {
  name = "${var.domain} Zone"
}

resource "gandi_zonerecord" "wildcard" {
  zone = gandi_zone.default.id
  name = "*"
  type = "A"
  ttl = 3600
  values = [
    data.kubernetes_service.istio_ingressgateway.load_balancer_ingress.0.ip
  ]
}

resource "gandi_domainattachment" "default" {
  domain = var.domain
  zone   = gandi_zone.default.id
}
