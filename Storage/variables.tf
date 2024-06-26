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

# Define Storageshare configuration
variable "storage-share" {
  type = map(object({
    storage_name=string
    sharename=string
    quota=number
    id=string
    permissions=string
    start=string
    expiry=string
  }))
  default = {
    storage_shar = {
    sharename="eppshare"
    storage_name="eppstorage"
    quota=50
    id="MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"
    permissions="rwdl"
    expiry="2019-07-02T10:38:21.0000000Z"
    start="2019-07-02T09:38:21.0000000Z"
    }
  }
  
}

# Define StorageAccount configuration
variable "storage-account" {
  type = map(object({
    storage_name=string
    account_tier=string
    replication_type=string
  }))
  default = {
    storage_acc = {
      storage_name="eppstorage"
      account_tier="Standard"
      replication_type="LRS"
    }
  }
  
}



