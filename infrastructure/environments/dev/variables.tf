variable "aws_region" {
  description = "AWS region for this environment"
  type        = string
  default     = null
}

variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
  default     = null
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = null
}