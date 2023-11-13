resource "aws_instance" "instance_linux3" {
  ami           = "ami-036f5574583e16426"   
  instance_type = "t2.2xlarge"
  subnet_id     = "subnet-d30219bb"

  key_name = "linux2" // para key-par generado ESTABA CON LINUX2 ANTES
  
  tags = {
    Name        = "Linux 3 para pruebas "
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_linux3.id]
}
