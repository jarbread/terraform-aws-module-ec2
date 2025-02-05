resource "aws_security_group" "security_group" {
  count = var.create ? 1 : 0

  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rule
    content {
      description      = try(ingress.value.description, "Managed by Terraform")
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = try(ingress.value.cidr_blocks, null)
      ipv6_cidr_blocks = try(ingress.value.ipv6_cidr_blocks, null)
      prefix_list_ids  = try(ingress.value.prefix_list_ids, null)
      security_groups  = try(ingress.value.security_groups, null)
      self             = try(ingress.value.self, false)
    }
  }

  dynamic "egress" {
    for_each = var.egress_rule
    content {
      description      = try(egress.value.description, "Managed by Terraform")
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = try(egress.value.cidr_blocks, null)
      ipv6_cidr_blocks = try(egress.value.ipv6_cidr_blocks, null)
      prefix_list_ids  = try(egress.value.prefix_list_ids, null)
      security_groups  = try(egress.value.security_groups, null)
      self             = try(egress.value.self, false)
    }
  }

  dynamic "egress" {
    for_each = var.enabled_default_egress_rule ? [1] : []
    content {
      description      = "default"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  tags = {
    "Name" = var.security_group_name
  }

  lifecycle {
    create_before_destroy = true
  }
}