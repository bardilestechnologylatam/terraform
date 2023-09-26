  resource "aws_security_group" "sg_docker" {
    name_prefix = "sg_docker"

    // Regla para permitir tráfico HTTP
    ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"  # -1 representa todos los protocolos
      cidr_blocks = ["0.0.0.0/0"]
    }

  // REGLAS DE SALIDA para todos
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}