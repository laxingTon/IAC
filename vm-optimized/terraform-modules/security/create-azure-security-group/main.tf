# Define variables for the resource group name, location, network security group name, and security rules
variable "rg_name" {}
variable "rg_location" {}
variable "nsg_name" {}
variable "nsg_rules" {}

# Create Network Security Group and define its rules
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name                = var.nsg_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  # Define dynamic security rules based on the provided list of rules
  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      direction                  = security_rule.value["direction"]
      access                     = security_rule.value["access"]
      protocol                   = security_rule.value["protocol"]
      source_port_range          = security_rule.value["source_port_range"]
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }
  }
}

# Output the ID of the created network security group
output "securitygroup_id" {
  value = azurerm_network_security_group.my_terraform_nsg.id
}
