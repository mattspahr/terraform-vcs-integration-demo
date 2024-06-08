# Create a security group that allows public web access
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_cidr]
  }
}

# Query for the AMI
data "aws_ami" "selected_ami" {
  most_recent = true

  # Filter the AMI by its ID
  filter {
    name   = "image-id"
    values = [var.ami]
  }
}

# Create a web server
resource "aws_instance" "web-server" {
  ami           = data.aws_ami.selected_ami.id
  instance_type = var.instance_type

  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = var.instance_name
  }

  user_data = file("${path.module}/scripts/user_data.sh")
}