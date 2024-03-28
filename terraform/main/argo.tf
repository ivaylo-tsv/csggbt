resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
  depends_on = [module.eks]
}

resource "helm_release" "argocd" {

  name              = "csggbt-argocd"
  chart             = "../../helm/charts/argocd"
  namespace         = kubernetes_namespace.argocd.metadata[0].name
  dependency_update = true

  values = []

  lifecycle {
    ignore_changes = all
  }
}


# resource "helm_release" "root-app" {
#   depends_on = [helm_release.argocd]

#   name              = "csggbt-root-app"
#   chart             = "../../helm/charts/root-app"
#   namespace         = "default"
#   dependency_update = true

#   values = []

#   lifecycle {
#     ignore_changes = all
#   }
# }