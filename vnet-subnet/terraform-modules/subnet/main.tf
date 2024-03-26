# Define variables for subnet name, resource group name, virtual network name, and address prefixes
variable "subnet_name" {}
variable "resource_group_name" {}
variable "subnet_virtual_network_name" {}
variable "subnet_address_prefixes" {}

# Create subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = var.subnet_name
  resource_group_name  =  var.resource_group_name
  virtual_network_name = var.subnet_virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
}

# Output the ID of the created subnet
output "subnet_id" {
  value = azurerm_subnet.my_terraform_subnet
}
