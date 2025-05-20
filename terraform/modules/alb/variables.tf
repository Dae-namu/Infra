variable "vpc_id" {
  description = "VPC ID where ALB will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "target_group_port" {
  description = "Port the ALB will forward to (NodePort)"
  type        = number
}

variable "target_group_targets" {
  description = "ALB 타겟 등록할 IP 목록"
  type        = list(string)
  default     = [] # <- 이렇게 추가!
}