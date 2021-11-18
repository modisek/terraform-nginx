resource "aws_security_group" "base_security_group" {
  name        = "base_security_group"
  description = "Base security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "base_security_group"
  }

}

resource "aws_instance" "dev" {
  ami                         = var.ami
  instance_type               = var.aws_instance_type
  key_name                    = aws_key_pair.admin_key.key_name
  security_groups             = ["${aws_security_group.base_security_group.name}"]
  associate_public_ip_address = true

  tags = { Name = "dev instance" }

}
resource "aws_instance" "server" {
  ami                         = var.ami
  instance_type               = var.aws_instance_type
  key_name                    = aws_key_pair.admin_key.key_name
  security_groups             = ["${aws_security_group.base_security_group.name}"]
  associate_public_ip_address = true

  tags = { Name = "nginx instance" }

}
