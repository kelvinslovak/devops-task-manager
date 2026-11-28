terraform {
  backend "s3" {
    bucket       = "devops-task-manager-tfstate-8c08f8badb14f7eee705c74437"
    key          = "eks/terraform.tfstate"
    region       = "us-east-1"
    profile      = "lab"
    encrypt      = true
    use_lockfile = true
  }
}
