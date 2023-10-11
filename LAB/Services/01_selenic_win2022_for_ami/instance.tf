resource "aws_instance" "win22" {
  ami           = "ami-060b1c20c93e475fd" // windows2022
  instance_type = "t2.2xlarge"
  subnet_id     = "subnet-d30219bb"

  key_name = "01-windowsServer2022" // para key-par generado
  
  tags = {
    Name        = "01_CTP_SOAVIRT_DATAREPO_FOR_AMI"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_ctp_soavirt_ami.id]
}
