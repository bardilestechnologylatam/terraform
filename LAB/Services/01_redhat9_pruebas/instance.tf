resource "aws_instance" "redhat9_pruebas" {
  ami           = "ami-02b8534ff4b424939"
  instance_type = "t2.large"
  subnet_id     = "subnet-d30219bb"

  key_name = "redhat9" // para key-par generado
  
  tags = {
    Name        = "01_REDHAT9_PRUEBAS_INSTALACIONES"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_redhat9.id]
}
