variable "vpc_id" {
  type    = string
  default = "vpc-0e2c61a4d583c1c1a"  # VPC LAB 10.0.0.24
}

resource "aws_subnet" "Subnet_LAB01" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.0.0/26"

  tags = {
    Name        = "LAB01"
    Environment = "Devops"
    Project     = "LAB"
  }

}

resource "aws_subnet" "Subnet_LAB02" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.0.64/26"

  tags = {
    Name        = "LAB02"
    Environment = "QA"
    Project     = "LAB"
  }
}

resource "aws_subnet" "Subnet_LAB03" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.0.128/26"
  
  tags = {
    Name        = "LAB03"
    Environment = "PRE"
    Project     = "LAB"
  }
}

resource "aws_subnet" "Subnet_LAB04" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.0.192/26"

  tags = {
    Name        = "LAB04"
    Environment = "SHARED"
    Project     = "LAB"
  }
}

