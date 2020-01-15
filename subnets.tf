resource "aws_vpc" "splunk_vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "splunk_subnet" {
  vpc_id     = "${aws_vpc.splunk_vpc.id}"
  cidr_block = "172.16.10.0/24"
}

resource "aws_internet_gateway" "splunk_gw" {
  vpc_id = "${aws_vpc.splunk_vpc.id}"
}

resource "aws_route_table" "splunk_route_table" {
  vpc_id = "${aws_vpc.splunk_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.splunk_gw.id}"
  }
}
resource "aws_route_table_association" "splunk_subnet_assoc" {
  subnet_id      = "${aws_subnet.splunk_subnet.id}"
  route_table_id = "${aws_route_table.splunk_route_table.id}"
}
