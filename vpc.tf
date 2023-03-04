resource "aws_vpc" "customVPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MyCustomVPC"
  }
}

resource "aws_internet_gateway" "igw" {

    vpc_id = aws_vpc.customVPC.id

    tags = {
      "Name" = "MyIGW"
    }
  
}

resource "aws_route" "routeIGW" {
  route_table_id            = aws_vpc.customVPC.main_route_table_id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
  
}

resource "aws_subnet" "public-a" {
  vpc_id     = aws_vpc.customVPC.id
  cidr_block = "10.0.0.0/28"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public-a"
  }
}

resource "aws_subnet" "public-b" {
  vpc_id     = aws_vpc.customVPC.id
  cidr_block = "10.0.0.16/28"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public-b"
  }
}