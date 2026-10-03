resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name ="dev-vpc"
    }
}

resource "aws_subnet" "dev-subnet01"{
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.dev.id 
}