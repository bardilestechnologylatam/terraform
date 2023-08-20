variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}

variable "environment" {
  description = ""
  default     = "LAB"
}

variable "project" {
  description = "Jenkins Sonarqube nginx vault"
  default     = "DevOp"
}