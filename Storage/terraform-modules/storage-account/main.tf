#Variables
variable "resource_group_location" {}
variable "resource_group_name" {}
variable "storage_name" {}
variable "account_tier" {}
variable "replication_type" {}


#Azure Storage Account
resource "azurerm_storage_account" "epp-storage" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
}

#Storage Account Name
output "storage_name" {
  value = azurerm_storage_account.epp-storage.name
}
