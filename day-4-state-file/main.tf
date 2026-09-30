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


resource "aws_instance" "bastion-instance" {
    ami = var.ami-id
    instance_type = var.instance-type
    subnet_id = aws_subnet.pub-sub-1.id
    tags = {
        Name = var.dev-instance-name
    }
}

# resource "aws_s3_bucket" "dev-buket" {
#   bucket = "my-bucketxys1"

# }




# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "sts:AssumeRole"
#             ],
#             "Principal": {
#                 "Service": [
#                     "ec2.amazonaws.com"
#                 ]
#             }
#         }
#     ]
# }