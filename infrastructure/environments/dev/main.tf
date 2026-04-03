provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

module "vpc" {
  source = "../../modules/vpc"

  cidr_block                  = "10.0.0.0/16"
  environment                 = var.environment
  az1                         = var.az1
  az2                         = var.az2
  public_subnet_az1_cidr      = "10.0.1.0/24"
  public_subnet_az2_cidr      = "10.0.2.0/24"
  private_app_subnet_az1_cidr = "10.0.3.0/24"
  private_app_subnet_az2_cidr = "10.0.4.0/24"
  private_db_subnet_az1_cidr  = "10.0.5.0/24"
  private_db_subnet_az2_cidr  = "10.0.6.0/24"
}

module "alb" {
  source = "../../modules/alb"

  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  alb_security_group_id = module.vpc.alb_security_group_id
}

module "ec2" {
  source = "../../modules/ec2"

  environment               = var.environment
  private_app_subnet_az1_id = module.vpc.private_app_subnet_az1_id
  ec2_security_group_id     = module.vpc.ec2_security_group_id
  target_group_arn          = module.alb.target_group_arn
  instance_profile_name     = module.iam.instance_profile_name
}

module "s3" {
  source      = "../../modules/s3"
  environment = var.environment
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}

module "kms" {
  source      = "../../modules/kms"
  environment = var.environment
}

module "secrets" {
  source      = "../../modules/secrets"
  environment = var.environment
  db_username = "appadmin"
}

module "rds" {
  source = "../../modules/rds"

  environment              = var.environment
  private_db_subnet_az1_id = module.vpc.private_db_subnet_az1_id
  private_db_subnet_az2_id = module.vpc.private_db_subnet_az2_id
  rds_security_group_id    = module.vpc.rds_security_group_id
  db_username              = "appadmin"
  db_password              = module.secrets.db_password
  rds_kms_key_arn          = module.kms.rds_kms_key_arn
}

module "cloudtrail" {
  source      = "../../modules/cloudtrail"
  environment = var.environment
}