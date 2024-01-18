module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-first-eks-cluster"
  subnets         = ["aws_subnet.pvt_subnet.id"]
  vpc_id          = "aws_vpc.main_vpc.id"
  cluster_version = "1.21"

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t2.micro"
    }
  }
}
