data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet" "default_subnet" {
  # Filter 1: Look for subnets that belong to the Default VPC ID.
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }

  # Filter 2: Only select subnets that are available (not deleted or broken).
  filter {
    name   = "state"
    values = ["available"]
  }
  
  # Terraform will pick one available subnet and use its ID.
}