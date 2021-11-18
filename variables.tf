variable "aws_region" {
  default     = "af-south-1"
  description = "AWS region"
}

variable "aws_ssh_admin_key_file" {}

variable "ami" {
  default = "ami-08a4b40f2fe1e4b35"
}

variable "aws_instance_type" {
  default = "t3.micro"
}
