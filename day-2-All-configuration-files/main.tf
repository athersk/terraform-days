resource "aws_vpc" "test" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_test
    }
}

resource "aws_subnet" "test-subnet" {
    cidr_block = var.subnet_cidr
    vpc_id = aws_vpc.test.id
    tags = {
        Name = var.subnet_test1
    }
}