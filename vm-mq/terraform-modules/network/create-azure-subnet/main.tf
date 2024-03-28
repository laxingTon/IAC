# Define variables for the resource group name, subnet name, virtual network name, and subnet address prefixes
variable "rg_name" {}
variable "azurerm_subnet_name" {}
variable "subnet_vnet_name" {}
variable "subnet_address_prefixes" {}

# Create subnet resource
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.subnet_vnet_name
  address_prefixes     = var.subnet_address_prefixes
}

# Output the ID of the created subnet
output "subnet_id" {
  value = azurerm_subnet.my_terraform_subnet.id
}
