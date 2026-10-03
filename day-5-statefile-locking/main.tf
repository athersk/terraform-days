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

resource "aws_instance" "dev" {
    ami ="ami-0d53cc9bd365ad65b"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.dev-subnet01.id
}