#Resource Group
module "resource-group" {
  source = "./terraform-modules/resource-group"

  resource_group_location = var.resource_group_location.US
  resource_group_name = var.resource_group_name
}

#Storage Account
module "storage-account" {
  source = "./terraform-modules/storage-account"
 
  storage_name=var.storage_account.storage_acc.storage_name
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
  account_tier=var.storage-account.storage_acc.account_tier
  replication_type=var.storage-account.storage_acc.replication_type
}

#Storage Share
module "storage-share" {
  source = "./terraform-modules/storage-share"
  
  storage_name= module.storage-account.storage_name
  sharename=var.storage-share.storage_shar.sharename
  quota=var.storage-share.storage_shar.quota
  id=var.storage-share.storage_shar.id
  permissions=var.storage-share.storage_shar.permissions
  start=var.storage-share.storage_shar.start
  expiry=var.storage-share.storage_shar.expiry
}
