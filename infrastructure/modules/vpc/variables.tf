variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "CIDR block for public subnet in AZ1"
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "CIDR block for public subnet in AZ2"
  type        = string
}

variable "private_app_subnet_az1_cidr" {
  description = "CIDR block for private app subnet in AZ1"
  type        = string
}

variable "private_app_subnet_az2_cidr" {
  description = "CIDR block for private app subnet in AZ2"
  type        = string
}

variable "private_db_subnet_az1_cidr" {
  description = "CIDR block for private db subnet in AZ1"
  type        = string
}

variable "private_db_subnet_az2_cidr" {
  description = "CIDR block for private db subnet in AZ2"
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