# 1. VPC 모듈
module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_a_cidr = var.public_subnet_a_cidr
  public_subnet_c_cidr = var.public_subnet_c_cidr
  private_subnet_a_cidr = var.private_subnet_a_cidr
  private_subnet_c_cidr = var.private_subnet_c_cidr
  az_a                 = var.az_a
  az_c                 = var.az_c
}

# 2. EKS Cluster용 IAM Role
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "eks.amazonaws.com" },
      Action   = "sts:AssumeRole"
    }]
  })
}

# 3. EKS 모듈 (클러스터 생성)
module "eks" {
  source                     = "./modules/eks"
  cluster_name               = var.cluster_name
  cluster_version            = var.cluster_version
  cluster_role_arn           = aws_iam_role.eks_cluster_role.arn
  subnet_ids                 = module.vpc.public_subnet_ids  # 또는 private_subnet_ids
  cluster_security_group_ids = [aws_security_group.eks_nodes_sg.id]
}

# 4. NodeGroup 모듈 (EC2 워커노드 + IAM Role 포함)
module "nodegroup" {
  source             = "./modules/nodegroup"
  cluster_name       = module.eks.cluster_name
  subnet_ids         = module.vpc.private_subnet_ids
  cluster_dependency = module.eks
}


# 5. ALB Ingress 모듈
module "alb" {
  source        = "./modules/alb"
  app_name      = var.app_name
  namespace     = var.namespace
  ingress_path  = var.ingress_path
  service_name  = "my-backend-service"

  depends_on = [module.eks, module.nodegroup]
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode([
      {
        rolearn  = module.nodegroup.node_role_arn  # <- outputs.tf로 받아오기
        username = "system:node:{{EC2PrivateDNSName}}"
        groups   = ["system:bootstrappers", "system:nodes"]
      }
    ])
  }

  depends_on = [module.eks, module.nodegroup]
}
