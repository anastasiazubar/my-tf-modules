variable "cidr_block" {}
variable "availability_zones" {
  type = list(string)
 }
variable "name_prefix" {}
variable "image_id" {}
variable "instance_type" {}
variable "key_name" {}


