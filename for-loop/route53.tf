resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.terraform
  zone_id = "${var.r53_zoneid}"
  name    = "${each.key}.${var.domain_name}" ### we are concatinating the two string variables
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite   = true
}