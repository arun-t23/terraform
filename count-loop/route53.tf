resource "aws_route53_record" "roboshop" {
    count   =   4 
  zone_id = "${var.r53_zoneid}"
  name    = "${var.instance_name[count.index]}.${var.domain_name}" ### we are concatinating the two string variables
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite   = true
}