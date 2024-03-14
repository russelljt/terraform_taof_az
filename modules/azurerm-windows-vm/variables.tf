variable "rg_name" {
    type = string
    description = "Name of the Resource Group"
}

variable "rg_location" {
    type = string
    description = "Name of the VNet"
}

variable "vm_nic_name" {
    type = string
    description = "Name of the VM Nic"
}

variable "srv_subnet_id" {
    type = string
    description = "ID of the server subnet"
}

variable "vm_name" {
  type = string
  description = "Name of the VM"
}

variable "vm_sku" {
    type = string
    description = "VM Sku"
    default = "Standard_B2ms"
}