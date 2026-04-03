variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ALB target group"
  type        = string
}

variable "public_subnet_az1_id" {
  description = "Public subnet AZ1 ID"
  type        = string
}

variable "public_subnet_az2_id" {
  description = "Public subnet AZ2 ID"
  type        = string
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}