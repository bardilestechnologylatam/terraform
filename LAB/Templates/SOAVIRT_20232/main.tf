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

resource "aws_instance" "aws_instance" {
  ami           = "ami-0bf7a5babf27e3031" 
  instance_type = "t2.2xlarge"
  subnet_id     = "subnet-d30219bb"

  key_name = "01-windowsServer2019" // para key-par generado
  
  tags = {
    Name        = "SELENIC_IJ_SOATEST_LOADTEST_LTC"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_soavirt20232.id]
}


variable "environment" {
  description = "KIT BASE SOAVIRT 2023.2"
  default     = "SOAVIRT 2023.2"
}

variable "project" {
  description = "KIT BASE AUTOMATIZACION"
  default     = "SOAVIRT 2023.2"
}

resource "aws_security_group" "sg_soavirt20232" {
  name_prefix = "sg_soavirt20232"

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
    from_port   = 3389
    to_port     = 3389
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
    from_port   = 8005
    to_port     = 8005
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
    from_port   = 9080
    to_port     = 9080
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