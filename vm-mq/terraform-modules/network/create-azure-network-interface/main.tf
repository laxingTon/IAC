# Define variables for the resource group location and name
variable "rg_location" {}
variable "rg_name" {}

# Define variables for the network interface name, IP configuration name, private IP address allocation, subnet ID, and public IP address ID
variable "azurerm_network_interface_name" {}
variable "azurerm_network_interface_ip_configuration_name" {}
variable "private_ip_address_allocation" {}
variable "ip_configuration_subnet_id" {}
variable "ip_configuration_public_ip_address_id" {}

# Create network interface resource
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = var.azurerm_network_interface_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.azurerm_network_interface_ip_configuration_name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.ip_configuration_public_ip_address_id
  }
}

# Output the ID of the created network interface
output "network_interface_id" {
  value = azurerm_network_interface.my_terraform_nic.id
}
