# Define variables for the network security group ID and network interface ID
variable "connect_nsg_id" {}
variable "connect_nsg_nic_id" {}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = var.connect_nsg_nic_id
  network_security_group_id = var.connect_nsg_id
}
