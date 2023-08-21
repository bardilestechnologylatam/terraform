resource "aws_instance" "devopstools" {
  ami           = "ami-0ccabb5f82d4c9af5"
  instance_type = "t2.micro"
  subnet_id     = "subnet-d30219bb"
  
  tags = {
    Name        = "devopstools"
    Environment = var.environment
    Project     = var.project
    AutoShutdown = "true"
  }

  vpc_security_group_ids = [aws_security_group.instance_sg_devopstools.id]
}