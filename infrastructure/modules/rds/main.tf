resource "aws_db_subnet_group" "this" {
  name = "${var.environment}-db-subnet-group"

  subnet_ids = [
    var.private_db_subnet_az1_id,
    var.private_db_subnet_az2_id
  ]

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "this" {
  identifier             = "${var.environment}-rds"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "appdb"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.rds_security_group_id]
  publicly_accessible    = false
  skip_final_snapshot    = true

  storage_encrypted = true
  kms_key_id        = var.rds_kms_key_arn

  tags = {
    Name        = "${var.environment}-rds"
    Environment = var.environment
  }
}