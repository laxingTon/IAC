# # Define resource group configuration
# variable "resource_group_location" {
#   type = map(string)
#   default = {
#     "US" = "eastus"
#   }
#   description = "Location of the resource group."
# }

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}


# Define project name used as a prefix for resource names
variable "project_name" {
  type        = string
  description = "Project name to prefix resource names"
}

# Define resource group configuration
variable "resource_group" {
  type = map(object({
    name     = string
    location = map(string)
  }))
  default = {
    rg = {
      name = "rg"
      location = {
        "EastUS"         = "eastus"
        "EastUS2"        = "eastus2"
        "WestUS"         = "westus"
        "CentralUS"      = "centralus"
        "SouthCentralUS" = "southcentralus"
        "NorthCentralUS" = "northcentralus"
        "WestCentralUS"  = "westcentralus"
        "BrazilSouth"    = "brazilsouth"
      }
    }
  }
}


# Define Eventhub configuration
variable "eventhub" {
  type = map(object({
   namespace-name=string
   eventhub-name=string
   partition=number
   msg=number
  }))
  default = {
    py = {
      namespace-name="epp-namespace"
      eventhub-name="epp-namespace1"
      partition=2
      msg=1
    }
  }
  
}

# Define Namespace configuration
variable "namespace" {
  type = map(object({
    namespace-sku=string
    namespace-capacity=number
    namespace-env=string
  }))
  default = {
    mod = {
      namespace-sku="Standard"
      namespace-capacity=1
      namespace-env="Prod"
    }
  }
  
}