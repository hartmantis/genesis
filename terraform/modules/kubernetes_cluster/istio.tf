data "helm_repository" "istio" {
  name = "istio.io"
  url  = "https://storage.googleapis.com/istio-release/releases/${var.istio_version}/charts/"
}

# TODO: Terraform's Helm provider doesn't yet support Tiller-less Helm. Given
# that Tiller isn't long for this world and this is all a big WIP, we won't
# worry too much for now about Tiller's security.

# resource "kubernetes_namespace" "istio" {
#   metadata {
#     name = "istio-system"
#   }
# }
# 

# A translation of https://raw.githubusercontent.com/istio/istio/release-1.2/install/kubernetes/helm/helm-service-account.yaml, minus the implicit defaults.
resource "kubernetes_service_account" "tiller" {
  metadata {
    name      = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = "tiller"
  }
  role_ref {
    # TODO: The docs say these are implicit defaults for kind and api_group...?
    kind      = "ClusterRole"
    name      = "cluster-admin"
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "tiller"
    namespace = "kube-system"
  }
}

resource "helm_release" "istio-init" {
  name       = "istio-init"
  repository = "${data.helm_repository.istio.metadata.0.name}"
  # The version shouldn't be required, but trying to `helm install istio.io/istio-init`
  # with an RC version results in "matching version '' not found in istio.io index".
  chart     = "${data.helm_repository.istio.metadata.0.name}/istio-init"
  version   = var.istio_version
  namespace = "istio-system"
}

resource "helm_release" "istio" {
  name       = "istio"
  repository = "${data.helm_repository.istio.metadata.0.name}"
  # The version shouldn't be required, but trying to `helm install istio.io/istio-init`
  # with an RC version results in "matching version '' not found in istio.io index".
  chart     = "${data.helm_repository.istio.metadata.0.name}/istio"
  version   = var.istio_version
  namespace = "istio-system"

  # TODO: Tune these resource requests for the size of our small cluster. Right
  # now they're set to 1/4 the default just to fit them in.
  set {
    name  = "pilot.resources.requests.memory"
    value = "512Mi"
  }

  set {
    name  = "pilot.resources.requests.cpu"
    value = "125m"
  }

  set {
    name  = "mixer.telemetry.resources.requests.cpu"
    value = "250m"
  }

  set {
    name  = "mixer.telemetry.resources.requests.memory"
    value = "256Mi"
  }
}
