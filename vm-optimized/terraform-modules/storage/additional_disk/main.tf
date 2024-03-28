variable "rg_location" {}
variable "rg_name" {}
variable "diskname" {}
variable "storage_account_type" {}
variable "create_option" {}
variable "disk_size_gb" {}

#Managed Disk
resource "azurerm_managed_disk" "mount" {
  name                 = var.diskname
  location            = var.rg_location
  resource_group_name = var.rg_name 
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
}

output "disk_id" {
    value = azurerm_managed_disk.mount.id
}


