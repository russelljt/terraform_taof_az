# Configure default NSG
resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = var.rg_location
  resource_group_name = var.rg_name
}


# Configure VNet
resource "azurerm_virtual_network" "vnet"{
  name                  = var.vnet_name
  address_space         = var.vnet_address_space
  location              = var.rg_location
  resource_group_name   = var.rg_name
  # dns_servers = []

  subnet {
    name                = var.srv_subnet_name
    address_prefix      = var.srv_subnet_prefix
  }

  subnet {
    name                = "GatewaySubnet"
    address_prefix      = var.gw_subnet_prefix
  }

  tags = {
    env = "tftesting"
  } 
}