# Define variables for virtual network name, address space, resource group location, and resource group name
variable "virtual_network_name" {}
variable "virtual_network_address_space" {}
variable "resource_group_location" {}
variable "resource_group_name" {}
variable "tags" {}

# Create a virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

# Output the name of the created virtual network
output "virtual_network_name" {
  value = azurerm_virtual_network.my_terraform_network.name
}
