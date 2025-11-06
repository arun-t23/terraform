variable "environment" {
  default = "t3.micro"
}


variable "instance_name" {
  default = ["mongodb", "redis", "mysql", "rabbitmq"]
}

variable "r53_zoneid" {
    type        = string
    default     = "Z101103636O9J5N20O0OE"
}

variable "domain_name" {
    type    = string
    default =  "cloudquestdev.com "
}