variable "amiid" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "RHEL ami id"
}


variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "terraform"
    terraform   = "True"
    description = "tags of ec2"
  }
}


variable "sg_name" {
  type    = string
  default = "allow_all_traffic"
}

variable "egress_from_port" {
  type    = number
  default = 0
}

variable "egress_to_port" {
  type    = number
  default = 0
}

variable "ingress_from_port" {
  type    = number
  default = 0
}

variable "ingress_to_port" {
  type    = number
  default = 0
}
variable "protocol" {
  type    = string
  default = "-1"
}

variable "cidr_block" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
