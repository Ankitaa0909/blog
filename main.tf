provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "blog_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Blog-VPC"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.blog_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.blog_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "PrivateSubnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.blog_vpc.id
}

resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.blog_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-Route-Table"
  }
}

resource "aws_route_table_association" "public_assoc" {

  subnet_id      = aws_subnet.public.id

  route_table_id = aws_route_table.public_rt.id

}

resource "aws_security_group" "blog_sg" {

  name = "blog-sg"

  vpc_id = aws_vpc.blog_vpc.id

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port = 8080

    to_port = 8080

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port = 3306

    to_port = 3306

    protocol = "tcp"

    cidr_blocks = ["10.0.0.0/16"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }
}

resource "aws_instance" "bastion" {

  ami = "ami-006f82a1d5a27da54"

  instance_type = "t2.micro"

  subnet_id = aws_subnet.public.id

  key_name = "blog-key"

  vpc_security_group_ids = [aws_security_group.blog_sg.id]

  tags = {

    Name = "Bastion"

  }

}

resource "aws_instance" "application" {

  ami = "ami-006f82a1d5a27da54"

  instance_type = "t2.micro"

  subnet_id = aws_subnet.public.id

  key_name = "blog-key"

  vpc_security_group_ids = [aws_security_group.blog_sg.id]

  tags = {

    Name = "Application"

  }

}

resource "aws_instance" "database" {

  ami = "ami-006f82a1d5a27da54"

  instance_type = "t2.micro"

  subnet_id = aws_subnet.private.id

  key_name = "blog-key"

  vpc_security_group_ids = [aws_security_group.blog_sg.id]

  tags = {

    Name = "Database"

  }

}
