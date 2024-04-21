variable "aws_region" {
    default = "ap-southeast-1"
}

variable "Key_name" {
    default = "ram.pem"
}

variable "vpc_cidr" {
    default = "172.0.0.0/24"
}
variable "subnet_cidr"{
    type = list(string)
    default = ["172.0.0.0/25","172.0.0.128/25"]

}

variable "availability_zones" {
    type = list(string)
    default = ["ap-southeast-1a","ap-southeast-1b"] 
}

variable "Kubernates_ami" {
    default = "ami-06c4be2792f419b7b"
}

variable "master_instance_type" {
    default = "t2.medium"
}

variable "worker_instance_type" {
    default = "t2.micro"
}

