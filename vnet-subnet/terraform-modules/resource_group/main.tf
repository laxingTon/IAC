# Define variables for resource group location and name
variable "resource_group_location" {}

variable "resource_group_name" {}

# Create an Azure resource group with the specified location and name
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

# Output the name, ID, and location of the resource group
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}
