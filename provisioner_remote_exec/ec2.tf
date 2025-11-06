resource "aws_instance" "example" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_traffic.id]

  tags = {
    Name      = "terraform"
    terraform = "True" ### Just metadata to know its created by terraform
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
  }

  provisioner "local-exec" {
    command = "echo  resource is destroyed"
    when    = destroy
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "echo Sytem is destroying"
    ]
    when = destroy
  }


}

resource "aws_security_group" "allow_all_traffic" {
  name = "allow_all_traffic"

  egress {
    from_port   = 0 ### from port 0 to port 0 means all ports
    to_port     = 0
    protocol    = "-1"          ## -1 meana all protocols
    cidr_blocks = ["0.0.0.0/0"] ## internet
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_traffic" ### just for reference
  }
}