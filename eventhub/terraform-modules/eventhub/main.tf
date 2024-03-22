variable "resource_group_location" {}
variable "resource_group_name" {}
variable "namespace-name" {}
variable "eventhub-name" {}
variable "partition" {}
variable "msg" {}


resource "azurerm_eventhub" "epp-eventhub" {
  name                = var.eventhub-name
  namespace_name      = var.namespace-name
  resource_group_name = var.resource_group_name
  partition_count     = var.partition
  message_retention   = var.msg
}