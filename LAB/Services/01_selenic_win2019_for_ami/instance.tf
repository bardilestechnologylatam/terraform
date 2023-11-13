resource "aws_instance" "windows_instance" {
  ami           = "ami-0a1a6272c3e138311" // windows2022
  instance_type = "t2.2xlarge"
  subnet_id     = "subnet-d30219bb"

  key_name = "01-windowsServer2019" // para key-par generado
  
  tags = {
    Name        = "01_SELENIC_FOR_AMI"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_selenic_win19.id]
}


