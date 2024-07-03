
resource "aws_vpc" "capstone_vpc" {
  cidr_block = "10.10.0.0/16"
  tags ={
    Name="capstone_vpc"
  }
}

resource "aws_subnet" "public_subnet_1a" {
    vpc_id     = aws_vpc.capstone_vpc.id
    cidr_block = "10.10.1.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        Name = "public_subnet_a"
    }
}

resource "aws_subnet" "public_subnet_1b" {
    vpc_id     = aws_vpc.capstone_vpc.id
    cidr_block = "10.10.2.0/24"
    availability_zone = "ap-northeast-2b"
    tags = {
        Name = "public_subnet_b"
    }
}

# subnet (private)
resource "aws_subnet" "private_subnet_1a" {
    vpc_id     = aws_vpc.capstone_vpc.id
    cidr_block = "10.10.101.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        Name = "private_subnet_a"
    }
}

resource "aws_subnet" "private_subnet_1b" {
    vpc_id     = aws_vpc.capstone_vpc.id
    cidr_block = "10.10.102.0/24"
    availability_zone = "ap-northeast-2d"
    tags = {
        Name = "private_subnet_b"
    }
}
resource "aws_internet_gateway" "capstone_igw" {
  vpc_id = aws_vpc.capstone_vpc.id

  tags = {
    Name = "Capstone_IGW"
  }
}
resource "aws_route_table" "capstone_public" {
  vpc_id = aws_vpc.capstone_vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.capstone_igw.id
  }

  tags = {
    Name="capstone_public"
  }
}
resource "aws_route_table_association" "public-a" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.capstone_public.id
}
resource "aws_route_table_association" "public-b" {
  subnet_id = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.capstone_public.id
}

resource "aws_eip" "Capstone-nat-elp" {
  domain = "vpc"
}

resource "aws_nat_gateway" "capstoon-nat" {
  allocation_id = aws_eip.Capstone-nat-elp.id
  subnet_id     = aws_subnet.public_subnet_1a.id
  connectivity_type = "public"
  tags = {
    Name = "gw NAT"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.capstone_igw]
}

resource "aws_route_table" "capstone_private" {
  vpc_id = aws_vpc.capstone_vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.capstoon-nat.id
  }
  tags = {
    Name="capstone_private"
  }
}
resource "aws_route_table_association" "private-a" {
  subnet_id = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.capstone_private.id
  depends_on = [ aws_nat_gateway.capstoon-nat ]
}
resource "aws_route_table_association" "private-b" {
  subnet_id = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.capstone_private.id
    depends_on = [ aws_nat_gateway.capstoon-nat ]
}