module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.3"

  cluster_name    = "csggbt-eks-cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = var.vpc_id
  subnet_ids = [var.subnet-private-1, var.subnet-private-2]

  eks_managed_node_groups = {
    csggbt-eks-node-group = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3.large"]
      capacity_type  = "ON_DEMAND"
      ami_type       = "BOTTLEROCKET_x86_64"

      iam_role_additional_policies = {
        "asg": "${aws_iam_policy.node_group_additional.arn}"
      }

    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  tags = merge(
    { "Name" : "csggbt-eks-cluster" },
    var.tags
  )
}

# Create a service account for AWS LBC:

resource "kubernetes_service_account" "aws_load_balancer_controller_sa" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"

    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.eks_load_balancer_controller_role.arn
    }
  }
}
