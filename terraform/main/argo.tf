resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
  depends_on = [module.eks]
}

resource "helm_release" "argocd" {
  depends_on = [module.eks]

  name              = "csggbt-argocd"
  chart             = "./helm/charts/argocd"
  namespace         = kubernetes_namespace.argocd.metadata[0].name
  dependency_update = true

  values = []

  lifecycle {
    ignore_changes = all
  }
}

