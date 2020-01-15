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
