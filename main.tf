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

module "alb" {
  source              = "./modules/alb"
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  target_group_port   = 30080
  target_group_targets = ["10.0.1.100", "10.0.2.101"] # Node IP들
}

data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "eks_cluster_role" {
  name               = "eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
