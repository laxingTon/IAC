module "resource-group" {
  source = "./terraform-modules/resource-group"

  resource_group_location = var.resource_group_location.US
  resource_group_name = var.resource_group_name
}


module "namespace" {
  source = "./terraform-modules/namespace"

  namespace-name=var.namespace-name
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
  namespace-sku=var.namespace-sku
  namespace-capacity=var.namespace-capacity
  namespace-env=var.namespace-env
}


module "eventhub" {
  source = "./terraform-modules/eventhub"

  namespace-name=module.namespace.namespace-name
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
  eventhub-name = var.eventhub-name
  partition = var.partition
  msg = var.msg
}
