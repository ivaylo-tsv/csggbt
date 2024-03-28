resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
  depends_on = [module.eks]
}

# resource "helm_release" "git_repo_secret" {
#   depends_on = [module.eks]
#   name = "csggbt-repo-privatekey"
#   chart = "./helm/charts/csggbt-repo-privatekey"
#   dependency_update = true

#   values = []

#   lifecycle {
#     ignore_changes = all 
#   }
# }

resource "helm_release" "argocd" {

  name              = "csggbt-argocd"
  chart             = "./helm/charts/argocd"
  namespace         = kubernetes_namespace.argocd.metadata[0].name
  dependency_update = true

  values = []

  lifecycle {
    ignore_changes = all
  }
}