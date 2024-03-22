# Define variables for the resource group location and name
variable "rg_location" {}
variable "rg_name" {}

# Define variables for the virtual network name and address space
variable "vnet_name" {}
variable "vnet_address_space" {}

# Create virtual network resource
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.rg_location
  resource_group_name = var.rg_name
}

# Output the name of the virtual network
output "vnet_name" {
  value = azurerm_virtual_network.my_terraform_network.name
}
