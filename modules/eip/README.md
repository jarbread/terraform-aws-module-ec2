# **AWS EC2 EIP Terraform module**

Terraform module for creating AWS EC2 EIPs

## **Usage** 
```
create        = true

eip_to_create = 1
domain        = "vpc"
instance      = "id-qwerty123456"

tags = {
    "Name" = "nat-gateway-eip"
}
```
