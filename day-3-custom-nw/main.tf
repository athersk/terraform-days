resource "aws_vpc" "vpcdev" {
    cidr_block = var.vpc-cidr
    tags = {
        Name = var.vpc-dev
    }
}


resource "aws_subnet" "pub-sub-1" {
    cidr_block = var.subnet-cidr
    vpc_id = aws_vpc.vpcdev.id
    tags = {
        Name = var.pub-sub-1
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpcdev.id
    tags = {
        Name = var.dev-igw
    }
}



resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.vpcdev.id
    route {
        cidr_block = var.dev-pub-rt-cidr
        gateway_id= aws_internet_gateway.igw.id
    }
}




resource "aws_route_table_association" "pub-rt-assoc" {
    subnet_id = aws_subnet.pub-sub-1.id
    route_table_id = aws_route_table.pub-rt.id
}





resource "aws_security_group" "bastion-sg" {
    name = var.dev-sg
    vpc_id = aws_vpc.vpcdev.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" #any protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "bastion-instance" {
    associate_public_ip_address = true
    ami = var.ami-id
    instance_type = var.instance-type
    subnet_id = aws_subnet.pub-sub-1.id
    vpc_security_group_ids = [aws_security_group.bastion-sg.id]
    tags = {
        Name = var.dev-instance-name
    }
}



