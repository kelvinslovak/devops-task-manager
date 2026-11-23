output "ecr_repository_url" {
  description = "URL do repositorio ECR"
  value       = aws_ecr_repository.app.repository_url
}

output "ecr_repository_name" {
  description = "Nome do repositorio ECR"
  value       = aws_ecr_repository.app.name
}
