resource "aws_instance" "linux3" {
  ami           = "ami-0d406e26e5ad4de53" // linux3
  instance_type = "t2.xlarge"
  subnet_id     = "subnet-d30219bb"

  key_name = "linux3" // para key-par generado
  
  tags = {
    Name        = "01_CTP_SOAVIRT_DATAREPO_FOR_AMI"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_ctp_soavirt_ami.id]
}
