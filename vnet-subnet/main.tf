# Resource Group Module
module "resource_group" {
  source = "./terraform-modules/resource_group"

  # Set the location for the resource group
  resource_group_location = var.resource_group.rg.location.EastUS

  # Set the name for the resource group
  resource_group_name = "${var.project_name}${var.resource_group.rg.name}"
}

# Virtual Network Module
module "virtual_network" {
  source = "./terraform-modules/virtual_network"

  # Set the name and address space for the virtual network
  virtual_network_name          = "${var.project_name}${var.virtual_network.vnet.name}"
  virtual_network_address_space = var.virtual_network.vnet.address_prefix
  tags                          = var.virtual_network.vnet.tags

  # Associate the virtual network with the specified resource group
  resource_group_location = module.resource_group.resource_group_location
  resource_group_name     = module.resource_group.resource_group_name

}

# Define Subnets using a dynamic block
locals {
  subnets = {
    db_subnet = {
      name             = var.subnet.db.name
      address_prefixes = var.subnet.db.address_prefix
    }
    mq_subnet = {
      name             = var.subnet.mq.name
      address_prefixes = var.subnet.mq.address_prefix
    }
    file_storage_subnet = {
      name             = var.subnet.file_storage.name
      address_prefixes = var.subnet.file_storage.address_prefix
    }
    eventhub_subnet = {
      name             = var.subnet.eventhub.name
      address_prefixes = var.subnet.eventhub.address_prefix
    }
    private_endpoint_subnet = {
      name             = var.subnet.private_endpoint.name
      address_prefixes = var.subnet.private_endpoint.address_prefix
    }
  }
}

# Create Subnets dynamically
module "subnets" {
  source = "./terraform-modules/subnet"

  for_each                    = local.subnets
  subnet_name                 = "${var.project_name}${each.value.name}"
  resource_group_name         = module.resource_group.resource_group_name
  subnet_virtual_network_name = module.virtual_network.virtual_network_name
  subnet_address_prefixes     = each.value.address_prefixes
}
