# variable "resource_group_location" {}
# variable "resource_group_name" {}
# variable "vm_name" {}
# variable "vm_id" {}

# #Managed Disk
# resource "azurerm_managed_disk" "mount" {
#   name                 = "disk1"
#   location            = var.resource_group_location
#   resource_group_name = var.resource_group_name
#   storage_account_type = "Standard_LRS"
#   create_option        = "Empty"
#   disk_size_gb         = 10
# }

# #VM_data_disk Attachment
# resource "azurerm_virtual_machine_data_disk_attachment" "disk" {
#   managed_disk_id    = azurerm_managed_disk.mount.id
#   virtual_machine_id = var.vm_name
#   lun                = "10"
#   caching            = "ReadWrite"
# }

