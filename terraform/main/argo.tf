################################################################################
# Argo CD
# https://github.com/argoproj/argo-helm
################################################################################
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

#   values = []

  lifecycle {
    ignore_changes = all
  }

#   set {
#     name  = "argo-cd.controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#     value = module.iam_assumable_role_argocd.iam_role_arn
#     type  = "string"
#   }
#   set {
#     name  = "argo-cd.applicationSet.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#     value = module.iam_assumable_role_argocd.iam_role_arn
#     type  = "string"
#   }

#   set {
#     name  = "argo-cd.server.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#     value = module.iam_assumable_role_argocd.iam_role_arn
#     type  = "string"
#   }

#   set {
#     name  = "argo-cd.server.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#     value = module.iam_assumable_role_argocd.iam_role_arn
#     type  = "string"
#   }

#   set {
#     name  = "argocd-apps.applicationsets[0].additionalAnnotations.helm\\.sh/hook"
#     value = "post-install"
#     type  = "string"
#   }
}


