
resource "aws_vpc" "kube" {
    cidr_block = var.vpc_cidr
    tags = {
        "Name" = "Kube"
    }
}

resource "aws_internet_gateway" "kubeigw" {
    vpc_id = aws_vpc.kube.id
    tags = {
        "Name" = "kube-igw"
    }
}

resource "aws_subnet" "kube_subnets" {
    count = length(var.subnet_cidr)
    vpc_id = aws_vpc.kube.id
    cidr_block = element(var.subnet_cidr,count.index)
    availability_zone = element(var.availability_zones,count.index)
    map_public_ip_on_launch = true
    tags = {
        "Name"= "kube_subnets_${count.index +1}"
    }
}

resource "aws_route_table" "kube_route"{
    vpc_id = aws_vpc.kube.id
    route {
        gateway_id = aws_internet_gateway.kubeigw.id
        cidr_block = "0.0.0.0/0"
    }

    
}

resource "aws_route_table_association" "Kube_rta"{
    count = length(var.subnet_cidr)
    subnet_id = element(aws_subnet.kube_subnets.*.id,count.index)
    route_table_id = aws_route_table.kube_route.id

}