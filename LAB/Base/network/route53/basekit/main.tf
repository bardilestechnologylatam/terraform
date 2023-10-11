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


resource "aws_route53_record" "subdomain_record" {
  zone_id = "Z0191952CIR7TIW60AXH"
  name    = "basekit.laboratorytechnologylatam.com" # Reemplaza con tu subdominio
  type    = "A"
  ttl     = "300"
  # Apunta al mismo recurso que el dominio principal
  records = ["18.220.141.124"] 
}