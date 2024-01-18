module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-first-eks-cluster"
  subnets_ids         = ["aws_subnet.pvt_subnet.id"]
  vpc_id          = "aws_vpc.main_vpc.id"
  cluster_version = "1.21"



module "eks_node_group" {
  source          = "terraform-aws-modules/eks/aws//modules/node_group"
  cluster_name    = module.eks_cluster.my-first-eks-cluster
  cluster_id      = module.eks_cluster.cluster_id
  subnet_ids      = [aws_subnet.pvt_subnet.id]
  desired_capacity = 2
  max_capacity     = 3
  min_capacity     = 1
  instance_type    = "t2.micro"
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t2.micro"
    }
  }
}
