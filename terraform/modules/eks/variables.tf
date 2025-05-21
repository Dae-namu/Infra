variable "cluster_name" {
  type        = string
  description = "daenamu_cluster"
}

variable "cluster_version" {
  type        = string
  default     = "1.29"
  description = "daenamu_cluster_version"
}

variable "cluster_role_arn" {
  type        = string
  description = "daenamu_cluster_role"
}

variable "subnet_ids" {
  type        = list(string)
  description = "daenamu_cluster_subnet"
}

variable "cluster_security_group_ids" {
  type        = list(string)
  description = "daenamu_cluster_sec"
}


