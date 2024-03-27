#Variables
variable "namespace-name" {}
variable "resource_group_location" {}
variable "resource_group_name" {}
variable "namespace-sku" {}
variable "namespace-capacity" {}
variable "namespace-env" {}

#Creating Namespace
resource "azurerm_eventhub_namespace" "epp-namespace" {
  name                = var.namespace-name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.namespace-sku
  capacity            = var.namespace-capacity

  tags = {
    environment = var.namespace-env
  }
}

#Namespace Value
output "namespace-name" {
  value = azurerm_eventhub_namespace.epp-namespace.name
}

