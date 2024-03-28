# resource "kubernetes_namespace" "grafana" {
#   metadata {
#     name = "grafana"
#   }
#   depends_on = [module.eks]
# }

# # resource "helm_release" "grafana" {
# #   depends_on = [module.eks]

# #   name              = "csggbt-grafana"
# #   chart             = "./helm/charts/grafana"
# #   namespace         = kubernetes_namespace.grafana.metadata[0].name
# #   dependency_update = true

# #   values = []

# #   lifecycle {
# #     ignore_changes = all
# #   }
# # }
