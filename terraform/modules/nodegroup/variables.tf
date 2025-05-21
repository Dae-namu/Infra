variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "cluster_dependency" {
  description = "EKS 모듈 의존성 연결용"
  type        = any
}
