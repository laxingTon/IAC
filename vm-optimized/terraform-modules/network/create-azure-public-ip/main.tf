# Define variables for the resource group name, location, public IP name, and allocation method
variable "rg_name" {}
variable "rg_location" {}
variable "public_ip_name" {}
variable "public_ip_allocation_method" {}

# Create public IP resource
resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                = var.public_ip_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = var.public_ip_allocation_method
}

# Output the ID of the created public IP
output "public_ip_id" {
  value = azurerm_public_ip.my_terraform_public_ip.id
}
