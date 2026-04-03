data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = var.private_app_subnet_az1_id
  vpc_security_group_ids      = [var.ec2_security_group_id]
  associate_public_ip_address = false
  iam_instance_profile = var.instance_profile_name

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "Hello from secure private EC2" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "${var.environment}-ec2"
    Environment = var.environment
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.this.id
  port             = 80
}

