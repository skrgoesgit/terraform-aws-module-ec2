
variable "vpc_id" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = list(string)
}

variable "ssh_key_name" {
  type = string
}

variable "iam_role_name" {
  type = string
}

variable "secgrp_name" {
  type = string
}

variable "enabled_fw_ports" {
  type = list(string)
}
