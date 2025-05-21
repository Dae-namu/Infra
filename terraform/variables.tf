variable "vpc_name" {
  type        = string
  default     = "daenamu-vpc"
  description = "VPC 이름"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "VPC의 CIDR 범위"
}

variable "public_subnet_a_cidr" {
  type        = string
  default     = "10.10.1.0/24"
}

variable "public_subnet_c_cidr" {
  type        = string
  default     = "10.10.2.0/24"
}

variable "private_subnet_a_cidr" {
  type        = string
  default     = "10.10.3.0/24"
}

variable "private_subnet_c_cidr" {
  type        = string
  default     = "10.10.4.0/24"
}

variable "az_a" {
  type        = string
  default     = "ap-northeast-2a"
}

variable "az_c" {
  type        = string
  default     = "ap-northeast-2c"
}

variable "cluster_name" {
  type        = string
  default     = "daenamu-cluster"
}

variable "cluster_version" {
  type        = string
  default     = "1.29"
}

variable "app_name" {
  type        = string
  default     = "my-app"
}

variable "namespace" {
  type        = string
  default     = "default"
}

variable "ingress_path" {
  type        = string
  default     = "/"
}


variable "service_name" {
  type        = string
  description = "Helm으로 배포된 Kubernetes Service 이름"
}