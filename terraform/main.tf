module "vpc" {
  source = "./modules/vpc"
  # 기타 변수들
}

module "eks" {
  source = "./modules/eks"

  subnet_ids                 = module.vpc.public_subnet_ids
  cluster_security_group_ids = ["aws_security_group.eks-nodes-sg"]
  cluster_name               = "my-eks-cluster"
  cluster_role_arn           = aws_iam_role.eks_cluster_role.arn
}

