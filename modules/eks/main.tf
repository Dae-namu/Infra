resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_public_access  = true
    endpoint_private_access = true
    # 일단 public, private 접근 모두 허용하였습니다.

    security_group_ids = var.cluster_security_group_ids
    # Node Group에 적용할 보안 그룹에 대한 변수
  }

  enabled_cluster_log_types = var.enabled_cluster_log_types
  # CloudWatch를 통해 log를 수집할 수 있음
}
