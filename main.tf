# Configure the Azure provider
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
}

# Build RG
module "resourcegroup" {
  source      = "./modules/azurerm-resource-group"
  rg_name     = "TAOF-TF-RG"
  rg_location = "northcentralus"
}

# Build network and gateway
module "basenetwork" {
  source = "./modules/azurerm-vnet-2-subnets"

  rg_location        = module.resourcegroup.rg_location
  rg_name            = module.resourcegroup.rg_name
  vnet_name          = "TAOF-TF-VNET"
  vnet_address_space = ["172.19.150.0/24"]
  srv_subnet_name    = "TAOF-SRV-SUBNET"
  srv_subnet_prefix  = ["172.19.150.0/25"]
  gw_subnet_prefix   = ["172.19.150.128/27"]
}


module "vpngw" {
  source = "./modules/azurerm-vpngw"

  rg_location         = module.resourcegroup.rg_location
  rg_name             = module.resourcegroup.rg_name
  public_ip_name = "TAOF-TF-PUBIP"
  vpngw_name     = "TAOF-TF-VPNGW"
  gw_subnet_id = module.basenetwork.gwsubnet_id
}


module "windows_vm" {
  source = "./modules/azurerm-windows-vm"

  rg_location   = module.resourcegroup.rg_location
  rg_name       = module.resourcegroup.rg_name
  vm_nic_name   = "TAOF-TF-VM01-NIC"
  srv_subnet_id = module.basenetwork.srvsubnet_id
  vm_name       = "TAOF-TF-VM01"
}