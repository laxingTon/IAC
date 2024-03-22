#Resource Group
module "resource-group" {
  source = "./terraform-modules/resource-group"

  resource_group_location = var.resource_group_location.US
  resource_group_name = var.resource_group_name
}

#Storage Account
module "storage-account" {
  source = "./terraform-modules/storage-account"

  storage_name=var.storage_name
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
  account_tier=var.account_tier
  replication_type=var.replication_type
}

#Storage Share
module "storage-share" {
  source = "./terraform-modules/storage-share"

  storage_name=var.storage_name
  sharename=var.sharename
  quota=var.quota
  id=var.id
  permissions=var.permissions
  start=var.start
  expiry=var.expiry
}
