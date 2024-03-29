## Create 'AmazonEKSLoadBalancerControllerRole' IAM Role for the AWS Load Balancer Controller (LBC):

resource "aws_iam_role" "eks_load_balancer_controller_role" {
  name               = "AmazonEKSLoadBalancerControllerRole"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement": [{
      "Effect"   : "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action"   : "sts:AssumeRole"
    }]
  })

  tags = merge(
    { "Name" : "csggbt-iam-policy-lbc" },
    var.tags
  )
}

resource "aws_iam_policy" "lbc" {
  name = "csggbt-iam-lbc-policy"
  policy = file("../../policies/aws_lbc_iam_policy.json")
  description = "IAM Policy for the 'AmazonEKSLoadBalancerControllerRole' used by AWS LBC in csggbt-eks-cluster"

  tags = merge(
    { "Name" : "csggbt-iam-role-lbc" },
    var.tags
  )
}

resource "aws_iam_policy_attachment" "eks_load_balancer_controller_policy_attachment" {
  name       = "eks-load-balancer-controller-policy-attachment"
  roles      = [aws_iam_role.eks_load_balancer_controller_role.name]
  policy_arn = aws_iam_policy.lbc.arn
}