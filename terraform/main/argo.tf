resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
  depends_on = [module.eks]
}

resource "helm_release" "argocd-apps" {
  depends_on = [ helm_release.argocd ]

  name              = "argo-cd-apps"
  chart             = "../../argo/helm/charts/argocd-apps"
  namespace         = kubernetes_namespace.argocd.metadata[0].name
  dependency_update = true

  values = []

  lifecycle {
    ignore_changes = all
  }
}

resource "helm_release" "argocd" {
  depends_on = [kubernetes_service_account.aws_load_balancer_controller_sa]

  name              = "argo-cd"
  chart             = "../../argo/helm/charts/argocd"
  namespace         = kubernetes_namespace.argocd.metadata[0].name
  dependency_update = true

  values = []

  lifecycle {
    ignore_changes = all
  }
}

