variable "create" {
  type        = bool
  description = "Whether to create the eip"
  default     = true
}

variable "eip_to_create" {
  type        = number
  description = "Number of EIP to create"
  default     = 1
}

variable "address" {
  type        = string
  description = "IP address from the EC2 BYOIP pool"
  default     = null
}


variable "associate_with_private_ip" {
  type        = string
  description = "Whether to associate with a private ip"
  default     = null
}

variable "customer_owned_ipv4_pool" {
  type        = string
  description = "ID of the customer-owned address pool"
  default     = null
}

variable "domain" {
  type        = string
  description = "Indicate if this is for VPC"
  default     = "vpc"
}

variable "instance" {
  type        = string
  description = "The ID of the EC2 instance to attach to"
  default     = null
}

variable "network_interface" {
  type        = string
  description = "The network interface to associate with"
  default     = null
}

variable "network_border_group" {
  type        = string
  description = "The network interface to associate with"
  default     = null
}

variable "public_ipv4_pool" {
  type        = string
  description = "The EC2 IPv4 address pool identifier"
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "Maps of tags to assign to the resource"
  default     = {}
}
