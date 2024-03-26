variable "resource_group_location" {
  type = map(string)
  default = {
    "US" = "eastus"
  }
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}


variable "eventhub-map" {
  type = map(object({
   namespace-name=string
   eventhub-name=string
   partition=number
   msg=number
  }))
  default = {
    map = {
      namespace-name="epp-namespace"
      eventhub-name="epp-namespace1"
      partition=2
      msg=1
    }
  }
  
}

variable "namespace-map" {
  type = map(object({
    namespace-sku=string
    namespace-capacity=number
    namespace-env=string
  }))
  default = {
    map1 = {
      namespace-sku="Standard"
      namespace-capacity=1
      namespace-env="Prod"
    }
  }
  
}