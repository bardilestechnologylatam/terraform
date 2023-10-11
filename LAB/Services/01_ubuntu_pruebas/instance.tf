resource "aws_instance" "ubuntu_pruebas" {
  ami           = "ami-0430580de6244e02e"
  instance_type = "t2.large"
  subnet_id     = "subnet-d30219bb"

  key_name = "ubuntu" // para key-par generado
  
  tags = {
    Name        = "01_UBUNTU_PRUEBAS_INSTALACIONES"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_ubuntu.id]
}
