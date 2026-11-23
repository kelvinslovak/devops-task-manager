variable "aws_region" {
  description = "Regiao AWS do laboratorio"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "devops-task-manager"
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.10.0.0/16"
}
