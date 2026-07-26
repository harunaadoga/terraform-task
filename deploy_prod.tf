resource "aws_instance" "web_prod" {
  count                       = 3
  ami                         = var.ami_id
  instance_type               = "t3.large"
  vpc_security_group_ids      = [aws_security_group.sg1_dev.id]
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true

  user_data                   = <<-EOF
    #!/bin/bash
    echo "Hello World"
  EOF
  user_data_replace_on_change = true

  tags = {
    Name = "web-prod-${count.index + 1}"
  }
}
resource "aws_security_group" "sg1_prod" {
  name   = "sg1prod"
  vpc_id = aws_vpc.public-vpc.id
  ingress {
    from_port   = 8080
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
