# Define variables for the resource group location and name
variable "rg_location" {}
variable "rg_name" {}

# Define variables for the virtual machine configuration
variable "name" {}
variable "size" {}
variable "os_disk_name" {}
variable "os_disk_caching" {}
variable "os_disk_storage_account_type" {}
variable "source_image_reference_publisher" {}
variable "source_image_reference_offer" {}
variable "source_image_reference_sku" {}
variable "source_image_reference_version" {}
variable "computer_name" {}
variable "admin_username" {}

# Define variables for connecting to the virtual machine
variable "connect_nsg_nic_id" {}
variable "azurerm_storage_account_uri" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}
variable "ssh_timeout" {}
variable "file_source" {}
variable "file_destination" {}

# Create virtual machine resource
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = var.name
  location              = var.rg_location
  resource_group_name   = var.rg_name
  network_interface_ids = [var.connect_nsg_nic_id]
  size                  = var.size

  os_disk {
    name                 = var.os_disk_name
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }

  computer_name  = var.computer_name
  admin_username = var.admin_username

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  boot_diagnostics {
    storage_account_uri = var.azurerm_storage_account_uri
  }

  connection {
    host        = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
    user        = var.admin_username
    type        = "ssh"
    private_key = var.ssh_private_key
    timeout     = var.ssh_timeout
    agent       = false
  }
  
  provisioner "file" {
    source      = var.file_source
    destination = var.file_destination
  }

  provisioner "remote-exec" {
    inline = ["sudo apt update"]
  }

  provisioner "local-exec" {
    command = "echo completed >> env_vars.txt"
  }
}

# Output the public IP address of the virtual machine
output "public_ip_address" {
  value = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
}



output "vm_name" {
  value = azurerm_linux_virtual_machine.my_terraform_vm.name
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.my_terraform_vm.id
  
}
