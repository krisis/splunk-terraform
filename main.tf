provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "splunk_indexers" {
  ami                         = "ami-0a7d051a1c4b54f65"
  instance_type               = "i3.8xlarge"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.splunk_subnet.id}"
  security_groups             = ["${aws_security_group.splunk_ingress_all_test.id}"]
  count                       = 5
  key_name                    = "splunk-key"
}

resource "aws_instance" "splunk_master" {
  ami                         = "ami-0a7d051a1c4b54f65"
  instance_type               = "c5d.4xlarge"
  subnet_id                   = "${aws_subnet.splunk_subnet.id}"
  security_groups             = ["${aws_security_group.splunk_ingress_all_test.id}"]
  associate_public_ip_address = true
  key_name                    = "splunk-key"
}

resource "aws_instance" "splunk_searchhead" {
  ami                         = "ami-0a7d051a1c4b54f65"
  instance_type               = "c5d.9xlarge"
  subnet_id                   = "${aws_subnet.splunk_subnet.id}"
  security_groups             = ["${aws_security_group.splunk_ingress_all_test.id}"]
  associate_public_ip_address = true
  key_name                    = "splunk-key"
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
