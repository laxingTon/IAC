#Resource Group
module "resource-group" {
  source = "./terraform-modules/resource-group"

  resource_group_location = var.resource_group_location.US
  resource_group_name = var.resource_group_name
}

#Namespace
module "namespace" {
  source = "./terraform-modules/namespace"

  namespace-name=var.eventhub-map.space.namespace-name
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
  namespace-sku=var.namespace1-map.map1.namespace-sku
  namespace-capacity=var.namespace-map.map1.namespace-capacity
  namespace-env=var.namespace-map.map1.namespace-env
}


#Eventhub
module "eventhub" {
  source = "./terraform-modules/eventhub"

  namespace-name=module.namespace.space.namespace-name
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
  eventhub-name = var.eventhub-map.space.eventhub-name
  partition = var.eventhub-map.space.partition
  msg = var.eventhub-map.space.msg
}
