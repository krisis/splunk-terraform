resource "aws_vpc" "my_vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = "${aws_vpc.my_vpc.id}"
  cidr_block = "172.16.10.0/24"
}

resource "aws_internet_gateway" "my_gw" {
  vpc_id = "${aws_vpc.my_vpc.id}"
}

resource "aws_route_table" "my_route_table" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.my_gw.id}"
  }
}
resource "aws_route_table_association" "my_subnet_assoc" {
  subnet_id      = "${aws_subnet.my_subnet.id}"
  route_table_id = "${aws_route_table.my_route_table.id}"
}

resource "aws_security_group" "my_ingress_all_test" {
  name   = "my-allow-all-sg"
  vpc_id = "${aws_vpc.my_vpc.id}"
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
