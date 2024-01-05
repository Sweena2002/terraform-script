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
    availability_zone = "eu-west-2"
}

# Create EC2 within the subnet
resource "aws_instance" "example" {
  ami           = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pvt_subnet.id
  tags = {
    Name = "ExampleInstance"
  }
}
