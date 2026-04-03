output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "db_secret_name" {
  value = module.secrets.db_secret_name
}

output "cloudtrail_name" {
  value = module.cloudtrail.cloudtrail_name
}

output "cloudtrail_bucket_name" {
  value = module.cloudtrail.cloudtrail_bucket_name
}