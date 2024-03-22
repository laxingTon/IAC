variable "storage_name" {}
variable "sharename" {}
variable "quota" {}
variable "id" {}
variable "permissions" {}
variable "start" {}
variable "expiry" {}

#Storage Share
resource "azurerm_storage_share" "epp-share" {
  name                 = var.sharename
  storage_account_name = var.storage_name
  quota                = var.quota

  acl {
    id = var.id

    access_policy {
      permissions = var.permissions
      start       = var.quota
      expiry      = var.expiry
    }
  }
}
