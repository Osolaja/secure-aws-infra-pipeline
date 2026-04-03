variable "environment" {
  description = "Environment name"
  type        = string
}

variable "private_db_subnet_az1_id" {
  description = "Private DB subnet AZ1 ID"
  type        = string
}

variable "private_db_subnet_az2_id" {
  description = "Private DB subnet AZ2 ID"
  type        = string
}

variable "rds_security_group_id" {
  description = "RDS security group ID"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "rds_kms_key_arn" {
  description = "KMS key ARN for RDS encryption"
  type        = string
}