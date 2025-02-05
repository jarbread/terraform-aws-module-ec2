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

resource "aws_eip_association" "this" {
  count = var.create && var.associate_eip ? var.eip_to_create : 0

  allocation_id         = element(aws_eip.this.allocation_id, count.index)
  allow_reassociation   = var.allow_reassociation
  instance_id           = element(var.associate_instance_ids, count.index)
  network_interface_id  = element(var.associate_network_interface_ids, count.index)
  private_ip_address    = element(var.associate_private_ip_address, count.index)
  public_ip             = element(var.associate_public_ip, count.index)
}
