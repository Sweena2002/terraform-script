terraform {
  backend "s3" {
    bucket = "test-tftstate"
    key    = "s3/state/eks.tfstate"
    region = "eu-west-2"
  }
}
