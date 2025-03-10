resource "aws_eip" "this" {
  count = var.create ? var.eip_to_create : 0

  address                   = var.address
  associate_with_private_ip = var.associate_with_private_ip
  customer_owned_ipv4_pool  = var.customer_owned_ipv4_pool
  domain                    = var.domain
  instance                  = var.instance
  network_interface         = var.network_interface
  network_border_group      = var.network_border_group
  public_ipv4_pool          = var.public_ipv4_pool

  tags = var.tags
}
