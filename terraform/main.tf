# 1. VPC 모듈
module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_a_cidr = var.public_subnet_a_cidr
  public_subnet_c_cidr = var.public_subnet_c_cidr
  private_subnet_a_cidr = var.private_subnet_c_cidr
  private_subnet_c_cidr = var.private_subnet_c_cidr
  az_a                 = var.az_a
  az_c                 = var.az_c
}

# 2. EKS Cluster용 IAM Role
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "eks.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

# 3. EKS 모듈
module "eks" {
  source                     = "./modules/eks"
  cluster_name               = var.cluster_name
  cluster_version            = var.cluster_version
  cluster_role_arn           = aws_iam_role.eks_cluster_role.arn
  subnet_ids                 = module.vpc.public_subnet_ids
  cluster_security_group_ids = [aws_security_group.eks_nodes_sg.id]
}

# 4. NodeGroup IAM Role + Policy 정의는 nodegroup.tf에 따로 있음 (OK)

# 5. NodeGroup 리소스도 nodegroup.tf에서 관리 (자동 병합됨)

# 6. ALB Ingress 모듈 호출
module "alb" {
  source       = "./modules/alb"
  app_name     = var.app_name
  namespace    = var.namespace
  ingress_path = var.ingress_path
  service_name = "my-backend-service" # ← Helm에서 생성한 서비스 이름
}
