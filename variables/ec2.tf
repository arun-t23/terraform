resource "aws_instance" "example" {
  ami                    = var.amiid
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all_traffic.id]

  tags = var.ec2_tags
  ### Just metadata to know its created by terraform
}

resource "aws_security_group" "allow_all_traffic" {
  name = var.sg_name

  egress {
    from_port   = var.egress_from_port ### from port 0 to port 0 means all ports
    to_port     = var.egress_to_port
    protocol    = var.protocol   ## -1 meana all protocols
    cidr_blocks = var.cidr_block ## internet
  }

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_block
  }

  tags = {
    Name = "allow_all_traffic" ### just for reference
  }
}