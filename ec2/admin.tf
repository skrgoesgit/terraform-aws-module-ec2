###################################################
# EC2 - Test Instance

resource "aws_instance" "this" {
  ami                    = var.admin_node_base_ami_id
  instance_type          = var.admin_node_instance_type
  subnet_id              = element(var.ocp3_subnet_ids, count.index)
  vpc_security_group_ids = [aws_security_group.this.id]
  iam_instance_profile   = var.iam_instance_role_name
  key_name               = var.ssh_keypair_name

  tags = merge(
    var.tags,
    {
      "Name" = "Test-Instance atlantis pull request"
    },
  )

  lifecycle {
    ignore_changes = [
      ebs_block_device,
    ]
  }

}

resource "aws_security_group" "this" {
  name        = var.secgrp_name
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "this" {
  type                     = "ingress"
  from_port                = element(var.enabled_fw_ports, 0)
  to_port                  = element(var.enabled_fw_ports, 0)
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.this.id
}

resource "aws_security_group_rule" "addtional_rule" {
  count                    = var.enabled_fw_ports[1] ? 1 : 0
  type                     = "ingress"
  from_port                = element(var.enabled_fw_ports, 1)
  to_port                  = element(var.enabled_fw_ports, 1)
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.this.id
}
