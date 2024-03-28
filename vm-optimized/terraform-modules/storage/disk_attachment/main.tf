variable "disk_id" {}
variable "vm_id" {}
variable "lun" {}
variable "caching" {}


#VM_data_disk Attachment
resource "azurerm_virtual_machine_data_disk_attachment" "disk" {
  managed_disk_id    = var.disk_id
  virtual_machine_id = var.vm_id
  lun                = var.lun
  caching            = var.caching
}

