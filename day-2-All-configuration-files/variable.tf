variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    }

variable "subnet_cidr" {
    type = string 
    default = "10.0.1.0/24"

}

variable "vpc_test" {
    type = string
    default = "test-vpc"
}

variable "subnet_test1" {
    type = string
    default = "test-subnet-1"
}