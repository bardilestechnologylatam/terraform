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
  ami           = "ami-0a97ff7b6caa64bab" 
  instance_type = "t2.xlarge"
  subnet_id     = "subnet-d30219bb"

  key_name = "01-windowsServer2019" // para key-par generado: estaba con linux2 antes
  
  tags = {
    Name        = "SOAVIRT 2023.2"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_jenkins.id]
}


variable "environment" {
  description = "KIT BASE PARA JENKINS"
  default     = "JENKINS"
}

variable "project" {
  description = "KIT BASE PARA JENKINS"
  default     = "JENKINS"
}

resource "aws_security_group" "sg_jenkins" {
  name_prefix = "sg_jenkins"

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
    from_port   = 22
    to_port     = 22
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
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
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