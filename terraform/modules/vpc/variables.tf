variable "vpc_name" {
  description = "daenamu_vpc"
  type        = string 
  default     = "daenamu_vpc"
}

variable "vpc_cidr" {
  description = "daenamu_cidr"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "Public Subnet A의 CIDR"
  type        = string
  default     = "10.10.1.0/24"
}

variable "public_subnet_c_cidr" {
  description = "Public Subnet C의 CIDR"
  type        = string
  default     = "10.10.2.0/24"
}

variable "private_subnet_a_cidr" {
  type        = string
  description = "Private Subnet A CIDR"
  default     = "10.10.3.0/24"
}

variable "private_subnet_c_cidr" {
  type        = string
  description = "Private Subnet C CIDR"
  default     = "10.10.4.0/24"
}

variable "az_a" {
  description = "가용 영역 A"
  type        = string
  default     = "ap-northeast-2a"
}

variable "az_c" {
  description = "가용 영역 C"
  type        = string
  default     = "ap-northeast-2c"
}

