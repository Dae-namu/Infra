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
  description = "List of instance IDs or IPs for ALB target group"
  type        = list(string)
}
