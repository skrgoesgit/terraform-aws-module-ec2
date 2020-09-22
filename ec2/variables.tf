ariable "ocp3_subnet_ids" {
  9   type = list(string)
 10 }
 11
 12 variable "internal_subnet_ids" {
 13   type = list(string)
 14 }

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "iam_role_name" {
  type = string
}

variable "enabled_fw_ports" {
  type = list(string)
}
