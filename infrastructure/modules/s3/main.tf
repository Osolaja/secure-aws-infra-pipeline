resource "random_id" "suffix" {
  byte_length = 4
}


resource "aws_s3_bucket" "this" {
  bucket        = "${var.environment}-secure-bucket-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "${var.environment}-secure-bucket"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "secure-aws-infra-pipeline"
  }
}

# 🔒 Block ALL public access
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 🔐 Enable encryption (KMS)
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}