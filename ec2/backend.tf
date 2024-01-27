terraform {
  backend "s3" {
    bucket = "test-tftstate"
    key    = "s3/state/ec2.tfstate"
    region = "eu-west-2"
  }
}