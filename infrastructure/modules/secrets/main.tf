resource "random_id" "suffix" {
  byte_length = 2
}


resource "random_password" "db" {
  length  = 16
  special = true
}

resource "aws_secretsmanager_secret" "db" {
  name = "${var.environment}-rds-credentials-${random_id.suffix.hex}"

  tags = {
    Name        = "${var.environment}-rds-credentials"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "db" {
  secret_id = aws_secretsmanager_secret.db.id

  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db.result
  })
}