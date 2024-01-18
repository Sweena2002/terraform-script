module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-first-eks-cluster"
  subnets_ids         = ["aws_subnet.pvt_subnet.id"]
  vpc_id          = "aws_vpc.main_vpc.id"
  cluster_version = "1.21"
}

module "eks_eks-managed-node-group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  cluster_name    = module.eks.my-first-eks-cluster
  subnet_ids      = [aws_subnet.pvt_subnet.id]
  desired_capacity = 2
  max_capacity     = 3
  min_capacity     = 1
  instance_type    = "t2.micro"
  version = "19.21.0"
}
