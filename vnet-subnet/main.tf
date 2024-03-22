# Resource Group
module "resource-group" {
  source = "./terraform-modules/resource_group"

  resource_group_location = var.resource_group_location.US
  resource_group_name = var.resource_group_name
}

# Virtual Network
module "virtual-network" {
  source = "./terraform-modules/virtual_network"

  virtual_network_name = var.virtual_network.vnet.name
  virtual_network_address_space = var.virtual_network.vnet.address_prefix
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
}

# Subnet
module "DB_subnet" {
  source = "./terraform-modules/subnet"

  azurerm_subnet_name = var.azurerm_subnet.db.name
  resource_group_name = module.resource-group.resource_group_name
  azurerm_subnet_virtual_network_name = module.virtual-network.virtual_network_name
  azurerm_subnet_address_prefixes = var.azurerm_subnet.db.address_prefix
}

module "MQ_subnet" {
  source = "./terraform-modules/subnet"

  azurerm_subnet_name = var.azurerm_subnet.mq.name
  resource_group_name = module.resource-group.resource_group_name
  azurerm_subnet_virtual_network_name = module.virtual-network.virtual_network_name
  azurerm_subnet_address_prefixes = var.azurerm_subnet.mq.address_prefix
}

module "File_Storage_subnet" {
  source = "./terraform-modules/subnet"

  azurerm_subnet_name = var.azurerm_subnet.file_storage.name
  resource_group_name = module.resource-group.resource_group_name
  azurerm_subnet_virtual_network_name = module.virtual-network.virtual_network_name
  azurerm_subnet_address_prefixes = var.azurerm_subnet.file_storage.address_prefix
}

module "EventHub_subnet" {
  source = "./terraform-modules/subnet"

  azurerm_subnet_name = var.azurerm_subnet.eventhub.name
  resource_group_name = module.resource-group.resource_group_name
  azurerm_subnet_virtual_network_name = module.virtual-network.virtual_network_name
  azurerm_subnet_address_prefixes = var.azurerm_subnet.eventhub.address_prefix
}

module "Private_Endpoint_subnet" {
  source = "./terraform-modules/subnet"

  azurerm_subnet_name = var.azurerm_subnet.private_endpoint.name
  resource_group_name = module.resource-group.resource_group_name
  azurerm_subnet_virtual_network_name = module.virtual-network.virtual_network_name
  azurerm_subnet_address_prefixes = var.azurerm_subnet.private_endpoint.address_prefix
}
