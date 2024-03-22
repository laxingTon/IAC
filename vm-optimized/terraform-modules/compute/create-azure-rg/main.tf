# Define variables for the resource group location and name
variable "rg_location" {}
variable "rg_name" {}

# Create an Azure resource group with the specified location and name
resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = var.rg_name
}

# Output the name, ID, and location of the created resource group
output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "rg_id" {
  value = azurerm_resource_group.rg.id
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
}
