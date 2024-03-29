resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
  depends_on = [module.eks]
}

resource "helm_release" "argocd" {

  name              = "argo-cd"
  chart             = "../../helm/charts/argocd"
  namespace         = kubernetes_namespace.argocd.metadata[0].name
  dependency_update = true

  values = []

  lifecycle {
    ignore_changes = all
  }
}


resource "helm_release" "app-of-apps" {
  depends_on = [helm_release.argocd]

  name              = "app-of-apps"
  chart             = "../../helm/charts/root-app"
  dependency_update = true

  values = []

  lifecycle {
    ignore_changes = all
  }
}