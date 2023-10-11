resource "aws_instance" "docker_parasoft" {
  ami           = "ami-0d50e9ae42eead5cd"
  instance_type = "t2.large"
  subnet_id     = "subnet-d30219bb"

  key_name = "docker" // para key-par generado
  
  tags = {
    Name        = "01_docker_parasoft"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.sg_docker.id]
}
