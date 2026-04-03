variable "environment" {
  description = "Environment name"
  type        = string
}

variable "private_app_subnet_az1_id" {
  description = "Private app subnet AZ1 ID"
  type        = string
}

variable "ec2_security_group_id" {
  description = "EC2 security group ID"
  type        = string
}

variable "target_group_arn" {
  description = "ALB target group ARN"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name for EC2"
  type        = string
}