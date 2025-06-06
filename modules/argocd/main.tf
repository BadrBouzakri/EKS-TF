resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "6.9.0"
  create_namespace = true

  values = [
    templatefile("${path.module}/template/values.yaml", {
      argocd_server_host                     = var.argocd_server_host
      argocd_ingress_enabled                 = var.argocd_ingress_enabled
      argocd_ingress_tls_acme_enabled        = var.argocd_ingress_tls_acme_enabled
      argocd_ingress_ssl_passthrough_enabled = var.argocd_ingress_ssl_passthrough_enabled
      argocd_ingress_class                   = var.argocd_ingress_class
      profile                                = var.profile
    }),
    templatefile("${path.module}/template/repository_values.yaml", {
      "badr-project_repo_secret_key" = var.badr-project_repo_secret_key
      "badr-project_repo"            = var.badr-project_repo
    })
  ]
}

resource "helm_release" "argocd-apps" {
  name = "argocd-apps"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  namespace  = "argocd"
  version    = "2.0.0"

  values = [
    templatefile("${path.module}/template/application_values.yaml", {
      "badr-project_repo" = var.badr-project_repo
    })
  ]

  depends_on = [helm_release.argocd]
}

data "kubernetes_service" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = helm_release.argocd.namespace
  }
}
