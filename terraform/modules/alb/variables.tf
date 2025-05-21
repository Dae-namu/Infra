variable "app_name" {
  description = "애플리케이션 이름"
  type        = string
}

variable "namespace" {
  description = "Kubernetes 네임스페이스"
  type        = string
  default     = "default"
}

variable "ingress_path" {
  description = "라우팅 경로 (예: /)"
  type        = string
  default     = "/"
}

variable "service_name" {
  type        = string
  description = "Helm으로 배포된 Kubernetes Service 이름"
}
