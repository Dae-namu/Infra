# EKS Node Group Security Group
resource "aws_security_group" "eks_nodes_sg" {
  name        = "eks-nodes-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "Allow traffic from EKS control plane"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  # 또는 aws_eks_cluster.endpoint_public_access_cidrs
  } 

  ingress {
    description      = "Allow traffic from EKS control plane"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  # 또는 aws_eks_cluster.endpoint_public_access_cidrs
  } 

  ingress {
    description      = "Allow traffic from EKS control plane"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  # 또는 aws_eks_cluster.endpoint_public_access_cidrs
  }

  ingress {
    description      = "Allow worker - worker communication"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    self             = true
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-nodes-sg"
  }
}

