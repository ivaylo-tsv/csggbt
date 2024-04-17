## Create 'AmazonEKSLoadBalancerControllerRole' IAM Role for the AWS Load Balancer Controller (LBC):

resource "aws_iam_role" "eks_load_balancer_controller_role" {
  name = "AmazonEKSLoadBalancerControllerRole"
  assume_role_policy = templatefile("../../policies/aws_lbc_iam_trust_policy.json",
    {
      EKS_OIDC = module.eks.oidc_provider_arn
    }
  )

  tags = merge(
    { "Name" : "csggbt-iam-role-lbc" },
    var.tags
  )
}

resource "aws_iam_policy" "lbc" {
  name        = "csggbt-iam-lbc-policy"
  policy      = file("../../policies/aws_lbc_iam_policy.json")
  description = "IAM Policy for the 'AmazonEKSLoadBalancerControllerRole' used by AWS LBC in csggbt-eks-cluster"

  tags = merge(
    { "Name" : "csggbt-iam-policy-lbc" },
    var.tags
  )
}

resource "aws_iam_policy_attachment" "eks_load_balancer_controller_policy_attachment" {
  name       = "eks-load-balancer-controller-policy-attachment"
  roles      = [aws_iam_role.eks_load_balancer_controller_role.name]
  policy_arn = aws_iam_policy.lbc.arn
}

## Create a IAM resources for the EKS Cluster Autoscaler:

resource "aws_iam_role" "eks_cluster_autoscaler_iam_role" {
  name = "EKSClusterAutoscalerRole"
  assume_role_policy = templatefile("../../policies/eks_cluster_autoscaler_trust_policy.json",
    {
      EKS_OIDC = module.eks.oidc_provider_arn
    }
  )

  tags = merge(
    { "Name" : "csggbt-eks-cluster-autoscaler-iam-role" },
    var.tags
  )
}

resource "aws_iam_policy" "eks_cluster_autoscaler_iam_policy" {
  name        = "csggbt-eks-cluster-autoscaler-iam-policy"
  policy      = file("../../policies/eks_cluster_autoscaler_policy.json")
  description = "IAM Policy for the 'EKSClusterAutoscalerRole' used by csggbt-eks-cluster"

  tags = merge(
    { "Name" : "csggbt-eks-cluster-autoscaler-iam-policy" },
    var.tags
  )
}

resource "aws_iam_policy_attachment" "eks_cluster_autoscaler_iam_policy_attachment" {
  name       = "eks-cluster-autoscaler-iam-policy-attachment"
  roles      = [aws_iam_role.eks_cluster_autoscaler_iam_role.name]
  policy_arn = aws_iam_policy.eks_cluster_autoscaler_iam_policy.arn
}

## EKS Node Group additional policy 

resource "aws_iam_policy" "node_group_additional" {
  name = "csggbt-eks-node-group-additional"
  policy = file("../../policies/eks_node_group_additional_policy.json")
  description = "Additional permissions for EKS Node Group"

  tags = merge(
    { "Name": "csggbt-eks-node-group-additional"},
    var.tags
  )
}