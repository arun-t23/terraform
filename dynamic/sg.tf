
resource "aws_security_group" "allow_all_traffic" {
  name = "allow_all_traffic"

  egress {
    from_port   = 0 ### from port 0 to port 0 means all ports
    to_port     = 0
    protocol    = "-1"          ## -1 meana all protocols
    cidr_blocks = ["0.0.0.0/0"] ## internet
  }

  dynamic "ingress" {
    for_each = toset(var.ingress_ports)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_all_traffic" ### just for reference
  }
}