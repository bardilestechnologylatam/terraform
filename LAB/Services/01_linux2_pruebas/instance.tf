resource "aws_instance" "linux2_pruebas" {
  ami           = "ami-01f48e1e4b60cb973"
  instance_type = "t2.large"
  subnet_id     = "subnet-d30219bb"

  key_name = "linux2" // para key-par generado
  
  tags = {
    Name        = "01_LINUX_PRUEBAS_INSTALACIONES"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_linux2.id]
}
