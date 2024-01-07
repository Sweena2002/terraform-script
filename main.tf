#Create VPC 
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "main"
  }
}

# Create subnet within VPC
resource "aws_subnet" "pvt_subnet"{
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.0.0/25"
    
}

# Create EC2 within the subnet
resource "aws_instance" "example" {
  ami           = "ami-093cb9fb2d34920ad"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pvt_subnet.id
  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_s3_bucket" "s3" {
  bucket = "my-tf-statebucket"                  
}

resource "aws_s3_bucket_ownership_controls" "s3" {
  bucket = aws_s3_bucket.s3.id
  rule {
      object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "s3" {
  depends_on = [aws_s3_bucket_ownership_controls.s3]

  bucket = aws_s3_bucket.s3.id
  acl    = "private"
}
