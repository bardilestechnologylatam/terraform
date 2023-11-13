terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.13.0"
    }
  }
}
  
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "aws_instance_for_kitbase" {
  ami           = "ami-09db042ae38815824" 
  instance_type = "t2.xlarge"
  subnet_id     = "subnet-d30219bb"

  key_name = "linux3" // para key-par generado
  
  tags = {
    Name        = "01_CTP_SOAVIRT_DATAREPO_FROM_AMI"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_ctp_soavirt_from_ami.id]
}


variable "environment" {
  description = "KIT BASE EN /OPT"
  default     = "CTP DATAREPO SOAVIRT"
}

variable "project" {
  description = "KIT BASE EN /OPT"
  default     = "CTP DATAREPO SOAVIRT"
}

resource "aws_security_group" "sg_ctp_soavirt_from_ami" {
  name_prefix = "sg_ctp_soavirt_from_ami"

  // Regla basicas 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8090
    to_port     = 8090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Regla para permitir tráfico herramientas parasoft
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 7744
    to_port     = 7744
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2424
    to_port     = 2424
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // REGLAS DE SALIDA para todos
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}