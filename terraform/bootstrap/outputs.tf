output "terraform_state_bucket" {
  description = "Nome do bucket S3 para armazenar o Terraform State"
  value       = aws_s3_bucket.terraform_state.id
}
