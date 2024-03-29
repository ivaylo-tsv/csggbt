## Create 'AmazonEKSLoadBalancerControllerRole' IAM Role for the AWS Load Balancer Controller (LBC)

resource "aws_iam_policy" "lbc" {
  name = "csggbt-iam-lbc-policy"
  policy = file("../../policies/aws_lbc_iam_policy.json")
  description = "IAM Policy for the 'AmazonEKSLoadBalancerControllerRole' used by AWS LBC in csggbt-eks-cluster"

  tags = merge(
    { "Name" : "csggbt-iam-lbc-policy" },
    var.tags
  )
}