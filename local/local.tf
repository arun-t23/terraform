locals {
  instance_type = "t3.micro"
  common_name   = "${var.project}-${var.environment}"
  ami_id        = data.aws_ami.joindevops.id

  ec2_tags = merge(
    {
      Name = "${local.common_name}-local-demo"
    }
  )


}
