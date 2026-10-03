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
    instance_type = "t3.medium"
    subnet_id = aws_subnet.dev-subnet01.id
}

#security group
resource "aws_security_group" "dev-sg" {
    name = "dev-sg"
    vpc_id = aws_vpc.dev.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port= 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}