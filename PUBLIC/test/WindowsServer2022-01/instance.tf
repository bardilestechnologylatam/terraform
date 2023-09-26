resource "aws_instance" "instance_windowsServer2022" {
  ami           = "ami-0007e91afefcd1257"
  instance_type = "t2.large"
  subnet_id     = "subnet-d30219bb"

  key_name = "01-windowsServer2022" // para key-par generado
  
  tags = {
    Name        = "WindowsServer2022"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_windowsServer2022.id]
}
