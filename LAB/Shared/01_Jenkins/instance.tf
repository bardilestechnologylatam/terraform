resource "aws_instance" "Jenkins_shared" {
  ami           = "ami-0d406e26e5ad4de53" // Amazon linux 2023
  instance_type = "t2.large"
  subnet_id     = "subnet-d30219bb"

  key_name = "shared" // para key-par generado
  
  tags = {
    Name        = "01_Jenkins"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_jenkins.id]
}
