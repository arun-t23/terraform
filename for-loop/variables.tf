variable "environment" {
  default = "t3.micro"
}


variable "instances" {
  default = {

    mongodb = "t3.micro"
    redis="t3.micro"
    mysql="t3.micro"
    rabbitmq="t3.micro"

  }
  # default = ["mongodb", "redis", "mysql", "rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
}

variable "r53_zoneid" {
    type        = string
    default     = "Z101103636O9J5N20O0OE"
}

variable "domain_name" {
    type    = string
    default =  "cloudquestdev.com "
}