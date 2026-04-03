resource "aws_kms_key" "rds" {
  description             = "${var.environment} RDS KMS key"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name        = "${var.environment}-rds-kms-key"
    Environment = var.environment
  }
}

resource "aws_kms_alias" "rds" {
  name          = "alias/${var.environment}-rds-kms-key"
  target_key_id = aws_kms_key.rds.key_id
}