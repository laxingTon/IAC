# Module for creating Azure resource group
module "azure-resource-group" {
  source = "./terraform-modules/compute/create-azure-rg"

  rg_location = var.rg.rg.location.EastUS
  rg_name     = "${var.project_name}${var.rg.rg.name}"
}

# Module for creating Azure SSH
module "azure-ssh" {
  source = "./terraform-modules/compute/create-azure-ssh"

  rg_location = module.azure-resource-group.rg_location
  rg_id       = module.azure-resource-group.rg_id
}

# Module for creating Azure virtual network
module "azure_vnet" {
  source               = "./terraform-modules/network/create-azure-network"
  rg_location          = module.azure-resource-group.rg_location
  rg_name              = module.azure-resource-group.rg_name
  vnet_name            = "${var.project_name}${var.vnet.vnet.name}"
  vnet_address_space   = var.vnet.vnet.address_prefix
}

# Module for creating Azure subnet
module "azure_subnet" {
  source                  = "./terraform-modules/network/create-azure-subnet"
  azurerm_subnet_name     = var.subnet.subnet.name
  rg_name                 = module.azure-resource-group.rg_name
  subnet_vnet_name        = module.azure_vnet.vnet_name
  subnet_address_prefixes = var.subnet.subnet.address_prefix
}

# Module for creating Azure public IP
module "azure_public_ip" {
  source                     = "./terraform-modules/network/create-azure-public-ip"
  rg_location                = module.azure-resource-group.rg_location
  rg_name                    = module.azure-resource-group.rg_name
  public_ip_name             = "${var.project_name}${var.public_ip.ip.name}"
  public_ip_allocation_method = var.public_ip.ip.allocation_method
}

# Module for creating Azure security group
module "azure-securitygroup" {
  source        = "./terraform-modules/security/create-azure-security-group"
  rg_location   = module.azure-resource-group.rg_location
  rg_name       = module.azure-resource-group.rg_name
  nsg_name      = "${var.project_name}${var.nsg_name}"
  nsg_rules     = var.nsg_rules
}

# Module for creating Azure network interface
module "azure-network-interface" {
  source                                  = "./terraform-modules/network/create-azure-network-interface"
  rg_name                                 = module.azure-resource-group.rg_name
  rg_location                             = module.azure-resource-group.rg_location
  ip_configuration_subnet_id              = module.azure_subnet.subnet_id
  ip_configuration_public_ip_address_id   = module.azure_public_ip.public_ip_id
  azurerm_network_interface_name          = "${var.project_name}${var.nic.nic.name}"
  azurerm_network_interface_ip_configuration_name = "${var.project_name}${var.nic.nic.ip_config_name}"
  private_ip_address_allocation           = var.nic.nic.private_ip_alloc
}

# Module for connecting Azure network security group
module "azure-connect-nwtwork-securitygroup" {
  source                = "./terraform-modules/security/connect-network-securitygroup"
  connect_nsg_id        = module.azure-securitygroup.securitygroup_id
  connect_nsg_nic_id    = module.azure-network-interface.network_interface_id
}

# Module for creating Azure storage account
module azure-storage-account { 
  source                                         = "./terraform-modules/storage/create-azure-storage"
  rg_location                                    = module.azure-resource-group.rg_location
  rg_name                                        = module.azure-resource-group.rg_name
  azurerm_storage_account_account_tier           = var.storage.storage.tier
  azurerm_storage_account_account_replication_type = var.storage.storage.replication_type
}



# Module for creating Azure virtual machines
module "azure-vm" {
  source                            = "./terraform-modules/compute/create-azure-vm"
  rg_location                      = module.azure-resource-group.rg_location
  rg_name                          = module.azure-resource-group.rg_name
  connect_nsg_nic_id               = module.azure-network-interface.network_interface_id
  azurerm_storage_account_uri      = module.azure-storage-account.primary_blob_endpoint

  count                            = length(var.vms)
  name                             = "${var.project_name}${var.vms[count.index].name}"
  size                             = var.vms[count.index].size
  os_disk_name                     = var.vms[count.index].os_disk_name
  os_disk_caching                  = var.vms[count.index].os_disk_caching
  os_disk_storage_account_type     = var.vms[count.index].os_disk_storage_account_type
  source_image_reference_publisher = var.vms[count.index].source_image_reference_publisher
  source_image_offer               = var.vms[count.index].source_image_offer
  source_image_sku                 = var.vms[count.index].source_image_sku
  source_image_version             = var.vms[count.index].source_image_version
  computer_name                    = "${var.project_name}${var.vms[count.index].computer_name}"
  admin_username                   = "${var.project_name}${var.vms[count.index].admin_username}"
  ssh_public_key                   = module.azure-ssh.key_data
  ssh_private_key                  = module.azure-ssh.key_data_private
  ssh_timeout                      = var.vms[count.index].ssh_timeout
  file_source                      = var.vms[count.index].file_source
  file_destination                 = var.vms[count.index].file_destination
  
}