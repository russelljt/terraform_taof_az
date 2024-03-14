# Configure public gateway IP
resource "azurerm_public_ip" "publicip" {
  name                  = var.public_ip_name
  location              = var.rg_location
  resource_group_name   = var.rg_name

  allocation_method     = "Dynamic"
}

# Configure VPNGW
resource "azurerm_virtual_network_gateway""vpngw"{
  name                  = var.vpngw_name
  location              = var.rg_location
  resource_group_name   = var.rg_name
  sku                   = "Basic"
  type                  = "Vpn"
  vpn_type              = "RouteBased"

  ip_configuration {
    name                = "gatewayConfig"
    public_ip_address_id = azurerm_public_ip.publicip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id = var.gw_subnet_id
  }  
}