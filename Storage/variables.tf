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



