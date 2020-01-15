provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "splunk_indexers" {
  ami                         = "ami-0a7d051a1c4b54f65"
  instance_type               = var.indexer_type
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.splunk_subnet.id}"
  security_groups             = ["${aws_security_group.splunk_ingress_all_test.id}"]
  count                       = 5
  key_name                    = var.key_pair_name
}

resource "aws_instance" "splunk_master" {
  ami                         = "ami-0a7d051a1c4b54f65"
  instance_type               = var.master_type
  subnet_id                   = "${aws_subnet.splunk_subnet.id}"
  security_groups             = ["${aws_security_group.splunk_ingress_all_test.id}"]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name
}

resource "aws_instance" "splunk_searchhead" {
  ami                         = "ami-0a7d051a1c4b54f65"
  instance_type               = var.searchhead_type
  subnet_id                   = "${aws_subnet.splunk_subnet.id}"
  security_groups             = ["${aws_security_group.splunk_ingress_all_test.id}"]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name
}

output "splunk_searchhead" {
  value = aws_instance.splunk_searchhead.public_ip
}

output "splunk_master" {
  value = aws_instance.splunk_master.public_ip
}

output "splunk_indexers" {
  value = aws_instance.splunk_indexers[*].public_ip
}
