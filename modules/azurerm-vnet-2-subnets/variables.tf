variable "rg_name" {
    type = string
    description = "Name of the Resource Group"
}

variable "rg_location" {
    type = string
    description = "Name of the VNet"
}

variable "vnet_name" {
    type = string
    description = "Name of the VNet"
}

variable "vnet_address_space" {
    type = list
    description = "VNet address space in CIDR notation - e.g. [\"172.17.150.0/24\"]"
    default = ["172.17.150.0/24"]
}

variable "srv_subnet_name" {
    type = string
    description = "Server subnet name"
}

variable "srv_subnet_prefix" {
    type = list
    description = "Subnet address space in CIDR notation"
    default = ["172.17.150.0/25"]
}

variable "gw_subnet_prefix" {
    type = list
    description = "Gateway subnet address space in CIDR notation"
    default = ["172.17.150.128/27"]
}