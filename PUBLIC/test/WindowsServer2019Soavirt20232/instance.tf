resource "aws_instance" "windows_instance" {
  ami           = "ami-0a1a6272c3e138311"
  instance_type = "t2.xlarge"
  subnet_id     = "subnet-d30219bb"

  key_name = "01-windowsServer2019" // para key-par generado
  
  tags = {
    Name        = "WindowsServer2019_soavirt20232"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_windowsServer2019.id]
}
