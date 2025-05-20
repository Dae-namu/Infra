variable "cluster_name" {
  type        = string
  description = "EKS Cluster의 name"
}

variable "cluster_version" {
  type        = string
  default     = "1.29"
  description = "사용할 Kubernetes 버전"
}

variable "cluster_role_arn" {
  type        = string
  description = "EKS 클러스터 Role-arn"
}

variable "subnet_ids" {
  type        = list(string)
  description = "EKS subnet 리스트"
}

variable "enabled_cluster_log_types" {
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  description = "수집할 log의 type 정의"
}
# Cloudwatch에서 수집할 log의 type들 (나중에 필요 없는 지표는 제외해도 좋을 것 같아요.)

variable "cluster_security_group_ids" {
  type        = list(string)
  description = "Node Group에 적용할 보안 그룹의 ID"
}


