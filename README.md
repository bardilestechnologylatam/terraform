# Terraform
#### Ingreso al repositorio por ssh

## Prerrequisitos

- AWS CLI
- Terraform CLI

## Credenciales En variables de entorno
#### Linux / ejemplo

- $ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
- $ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
- $ export AWS_DEFAULT_REGION=us-west-2

#### Windows / ejemplo

- setx AWS_ACCESS_KEY_ID AKIAIOSFODNN7EXAMPLE
- setx AWS_SECRET_ACCESS_KEY wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
- setx AWS_DEFAULT_REGION us-west-2

### Comandos utiles para la ejecucion de un plan

- terraform init 
- terraform plan -out=plan.plan
- terraform show plan.plan / permite ver el plan y configuraciones
- terraform apply plan.plan

### Comandos utiles

terraform fmt / comprobar formato de ficheros coherentes
terraform validate / validar configuraciones sinteticas
terraform state / para ver stados de administracion. 
terraform state list / ver recursos usados

## Sistema BETA de ficheros

Infraestructura

├── LAB

    ├── BASE
        ├── Network
            ├── vpc
                ├── Subnet

        ├── Storage
            ├── S3
            ├── DynamoDB

    ├── SERVICES
        ├──WEBSITE

    ├── SHARED
        ├── JENKINS
        ├── SONAR
        ├── NEXUS