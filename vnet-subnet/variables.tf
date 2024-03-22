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

variable "virtual_network" {
  type = map(object({
    name = string  
    address_prefix = list(string)  
  }))
  default = {
    vnet = {
      name = "epp-vpc"   
      address_prefix = ["10.0.0.0/16"]
    }
  }
  
}


variable "azurerm_subnet" {
  type = map(object({
    name = string  
    address_prefix = list(string)  
  }))
  default = {
    db = {
      name = "db-subnet"   
      address_prefix = ["10.0.1.0/24"]
    }
    mq = {
      name = "mq-subnet"   
      address_prefix = ["10.0.2.0/24"]   
    }
    file_storage = {
      name = "file-storage-subnet"
      address_prefix = ["10.0.3.0/24"]
    }
    eventhub = {
      name = "eventhub-subnet"
      address_prefix = ["10.0.4.0/24"]
    }
    private_endpoint = {
      name = "private-endpoint-subnet"
      address_prefix = ["10.0.5.0/24"]
    }

  }
}



