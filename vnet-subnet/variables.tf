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

# Define virtual network configuration
variable "virtual_network" {
  type = map(object({
    name           = string
    address_prefix = list(string)
    tags           = map(string)
  }))
  default = {
    vnet = {
      name           = "vnet"
      address_prefix = ["10.0.0.0/16"]
      tags = {
        env        = "dev"
        department = "cloud-migration"
      }
    }
  }
}

# Define subnet configuration for Azure resources
variable "subnet" {
  type = map(object({
    name           = string
    address_prefix = list(string)
  }))
  default = {
    db = {
      name           = "db-subnet"
      address_prefix = ["10.0.1.0/24"]
    }
    mq = {
      name           = "mq-subnet"
      address_prefix = ["10.0.2.0/24"]
    }
    file_storage = {
      name           = "file-storage-subnet"
      address_prefix = ["10.0.3.0/24"]
    }
    eventhub = {
      name           = "eventhub-subnet"
      address_prefix = ["10.0.4.0/24"]
    }
    private_endpoint = {
      name           = "private-endpoint-subnet"
      address_prefix = ["10.0.5.0/24"]
    }
  }
}
