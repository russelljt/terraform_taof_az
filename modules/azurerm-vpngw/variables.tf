variable "rg_name" {
    type = string
    description = "Name of the Resource Group"
}

variable "rg_location" {
    type = string
    description = "Name of the VNet"
}

variable "public_ip_name" {
    type = string
    description = "Name of the public IP for the VPN Gateway"
}

variable "vpngw_name" {
    type = string
    description = "Name of the VPN Gateway"
}

variable "gw_subnet_id" {
    type = string
    description = "ID of GatewaySubnet"
}