variable "key_pair_name" {
  type = string
  default = "splunk-key"
}

variable "indexer_type" {
  type = string
  default = "i3.8xlarge"
}

variable "searchhead_type" {
  type = string
  default = "c5d.9xlarge"
}

variable "master_type" {
  type = string
  default = "c5d.4xlarge"
}

variable "minio_type" {
  type = string
  default = "i3.8xlarge"
}

variable "minio_count" {
  type = number
  default = 1
}

variable "minio_ami" {
  type = string
  default = "ami-0a7d051a1c4b54f65"
}
