#Resource Group
module "resource-group" {
  source = "./terraform-modules/resource-group"

  resource_group_location = var.resource_group_location.EastUS
  # resource_group_name = var.resource_group_name
  resource_group_name = "${var.project_name}${var.resource_group.rg.name}"
}

#Namespace
module "namespace" {
  source = "./terraform-modules/namespace"

  namespace-name=var.eventhub.py.namespace-name
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
  namespace-sku=var.namespace.mod.namespace-sku
  namespace-capacity=var.namespace.mod.namespace-capacity
  namespace-env=var.namespace.mod.namespace-env
}


#Eventhub
module "eventhub" {
  source = "./terraform-modules/eventhub"

  namespace-name=module.namespace.mod.namespace-name
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
  eventhub-name = var.eventhub.py.eventhub-name
  partition = var.eventhub.py.partition
  msg = var.eventhub.py.msg
}
