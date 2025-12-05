resource "aws_instance" "Docker" {
  ami               = "ami-09c813fb71547fc4f"
  instance_type     = "t3.micro"
  subnet_id     = data.aws_subnet.default_subnet.id
  vpc_security_group_ids   = [aws_security_group.allow_all_traffic.id] 
  user_data =  file("size.sh")
  root_block_device {
    volume_size = 50
  }

  tags = {
    Name = "Docker"
    terraform = "True"  ### Just metadata to know its created by terraform
  }
}

resource "aws_security_group" "allow_all_traffic" {
    name    = "allow_all_traffic"

    egress{
        from_port       = 0 ### from port 0 to port 0 means all ports
        to_port         = 0 
        protocol        = "-1" ## -1 meana all protocols
        cidr_blocks     = ["0.0.0.0/0"] ## internet
    }

    ingress{
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks    = ["0.0.0.0/0"]
    }

    tags    = {
        Name    = "allow_all_traffic" ### just for reference
    }
}