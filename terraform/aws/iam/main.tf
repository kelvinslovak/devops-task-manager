# Permite que o serviço EKS assuma esta role
data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

# Role utilizada pelo control plane do EKS
resource "aws_iam_role" "eks_cluster" {
  name               = "devops-task-manager-eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json

  tags = {
    Name = "devops-task-manager-eks-cluster-role"
  }
}

# Permissões AWS gerenciadas para o cluster
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Permite que instâncias EC2 assumam a role dos worker nodes
data "aws_iam_policy_document" "nodes_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Role dos futuros worker nodes
resource "aws_iam_role" "eks_nodes" {
  name               = "devops-task-manager-eks-nodes-role"
  assume_role_policy = data.aws_iam_policy_document.nodes_assume_role.json

  tags = {
    Name = "devops-task-manager-eks-nodes-role"
  }
}

# Permissões para os worker nodes
resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  role       = aws_iam_role.eks_nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

# Permissões para baixar imagens do ECR
resource "aws_iam_role_policy_attachment" "ecr_read_only" {
  role       = aws_iam_role.eks_nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}

# Permissões de rede para o plugin VPC CNI
resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  role       = aws_iam_role.eks_nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
