#create new vpc

resource "aws_vpc" "vpc-tf" {
    cidr_block = "192.168.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {Name = "Vpc-lab-2"}
}

resource "aws_internet_gateway" "igw-tf" {
    vpc_id = aws_vpc.vpc-tf.id
    tags = {Name = "igw-tf"}
}

#public subnet a creation

resource "aws_subnet" "public_subnet_a" {
    vpc_id = aws_vpc.vpc-tf.id
    cidr_block = "192.168.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {Name = "SN-Public-A"}
}



#public subnet b creation

resource "aws_subnet" "public_subnet_b" {
    vpc_id = aws_vpc.vpc-tf.id
    cidr_block = "192.168.16.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true
    tags = {Name = "SN-Public-B"}
}



#public subnet c creation

resource "aws_subnet" "public_subnet_c" {
    vpc_id = aws_vpc.vpc-tf.id
    cidr_block = "192.168.32.0/24"
    availability_zone = "us-east-1c"
    map_public_ip_on_launch = true
    tags = {Name = "SN-Public-C"}
}



#public subnet d creation

resource "aws_subnet" "public_subnet_d" {
    vpc_id = aws_vpc.vpc-tf.id
    cidr_block = "192.168.48.0/24"
    availability_zone = "us-east-1d"
    map_public_ip_on_launch = true
    tags = {Name = "SN-Public-D"}
}





#Routing table for public subnet

resource "aws_route_table" "public-RT" {
    vpc_id = aws_vpc.vpc-tf.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw-tf.id
    }
    tags = {Name = "RT-Public"}
}


#Associate routing table to public subnet a

resource "aws_route_table_association" "public-SN-RT-a" {
  subnet_id = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public-RT.id
}


#Associate routing table to public subnet b

resource "aws_route_table_association" "public-SN-RT-b" {
  subnet_id = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public-RT.id
}


#Associate routing table to public subnet c

resource "aws_route_table_association" "public-SN-RT-c" {
  subnet_id = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public-RT.id
}

#Associate routing table to public subnet d

resource "aws_route_table_association" "public-SN-RT-d" {
  subnet_id = aws_subnet.public_subnet_d.id
  route_table_id = aws_route_table.public-RT.id
}


output "public-subnet-id" {
    value = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id, aws_subnet.public_subnet_c.id, aws_subnet.public_subnet_d.id]
}



output "vpc-id" {
    value = aws_vpc.vpc-tf.id
}


