module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-first-eks-cluster"
  subnet_ids         = ["aws_subnet.pvt_subnet.id"]
  vpc_id          = "aws_vpc.main_vpc.id"
  cluster_version = "1.21"
}

module "eks_eks-managed-node-group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  cluster_name    = "my-first-eks-cluster"
  subnets         = ["aws_subnet.pvt_subnet.id"]
  version = "19.21.0"
}
