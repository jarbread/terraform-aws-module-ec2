# **AWS Security Group Terraform module**

Terraform module for creating security groups in AWS

## **Conditionals**
This module comes with a default egress rule that allows all traffic outbound. To turn it off specify the value below
```
  enabled_default_egress_rule = false
```

## **Usage**
```
create = true

security_group_name        = "web-sg"
vpc_id                     = "vpc-id1234567"
security_group_description = "Open Web Traffic"

ingress_rule = [
    {
      from_port = 80
      to_port = 80
      description = "web traffic"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 443
      to_port = 443
      description = "secured web traffic"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
]

egress_rule = [
    {
      from_port = 80
      to_port = 80
      description = "web traffic"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 443
      to_port = 443
      description = "secured web traffic"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
```
