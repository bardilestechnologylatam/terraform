resource "aws_instance" "jenkins_for_ami" {
  ami           = "ami-036f5574583e16426"
  instance_type = "t2.large"
  subnet_id     = "subnet-d30219bb"

  key_name = "linux2" // para key-par generado
  
  tags = {
    Name        = "01_JENKINS_FOR_AMI_LINUX3"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_linux3.id]
}
