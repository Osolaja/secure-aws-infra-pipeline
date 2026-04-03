terraform {
  backend "s3" {
    bucket  = "backend-pipeline-buckets"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}