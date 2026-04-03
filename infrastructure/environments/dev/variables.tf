variable "aws_region" {
  description = "AWS region for this environment"
  type        = string
}

variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "az1" {
  description = "First availability zone"
  type        = string
}

variable "az2" {
  description = "Second availability zone"
  type        = string
}