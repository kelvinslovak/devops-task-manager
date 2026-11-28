# Consultar o state da infraestrutura de rede
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket  = "devops-task-manager-tfstate-8c08f8badb14f7eee705c74437"
    key     = "network/terraform.tfstate"
    region  = "us-east-1"
    profile = "lab"
  }
}

# Consultar o state das IAM Roles
data "terraform_remote_state" "iam" {
  backend = "s3"

  config = {
    bucket  = "devops-task-manager-tfstate-8c08f8badb14f7eee705c74437"
    key     = "iam/terraform.tfstate"
    region  = "us-east-1"
    profile = "lab"
  }
}
