provider "aws" {
  region = "eu-west-2"  
}

resource "aws_s3_bucket" "s3" {
  bucket = "aws_s3_mybucket_s3.id" 
  acl    = "private"                  

}
