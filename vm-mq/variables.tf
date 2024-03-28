# Define variable for network security group rules
variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

# Define the Prefix for the resouces 
variable "project_name" {
  type        = string
  description = "provide the project name to add as a prefix to the resources name"

}

# Define variable for resource group details
variable "rg" {
  type = map(object({
    name     = string
    location = map(string)
  }))
  default = {
    rg = {
      name = "vpc"
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

# Define variable for virtual network details
variable "vnet" {
  type = map(object({
    name           = string
    address_prefix = list(string)
  }))
  default = {
    vnet = {
      name           = "vnet"
      address_prefix = ["10.0.0.0/16"]
    }
  }
}

# Define variable for subnet details
variable "subnet" {
  type = map(object({
    name           = string
    address_prefix = list(string)
  }))
  default = {
    subnet = {
      name           = "subnet"
      address_prefix = ["10.0.1.0/24"]
    }
  }
}

# Define variable for public IP details
variable "public_ip" {
  type = map(object({
    name              = string
    allocation_method = string
  }))
  default = {
    ip = {
      name              = "public-ip"
      allocation_method = "Dynamic"
    }
  }
}

# Define variable for network security group name
variable "nsg_name" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "lax-EPP-network-securitygroup"
}

# Define variable for network interface details
variable "nic" {
  type = map(object({
    name             = string
    ip_config_name   = string
    private_ip_alloc = string
  }))
  default = {
    nic = {
      name             = "nic"
      ip_config_name   = "nic-configuration"
      private_ip_alloc = "Dynamic"
    }
  }
}

# Define variable for storage account details
variable "storage" {
  type = map(object({
    tier             = string
    replication_type = string
  }))
  default = {
    storage = {
      tier             = "Standard"
      replication_type = "LRS"
    }
  }
}

# Define variable for virtual machine details
variable "vms" {
  type = list(object({
    name                             = string
    size                             = string
    os_disk_name                     = string
    os_disk_caching                  = string
    os_disk_storage_account_type     = string
    source_image_reference_publisher = string
    source_image_offer               = string
    source_image_sku                 = string
    source_image_version             = string
    computer_name                    = string
    admin_username                   = string
    ssh_timeout                      = number
    file_source                      = string
    file_destination                 = string
  }))
  default = [
    {
      name                             = "vm1"
      size                             = "Standard_DS1_v2"
      os_disk_name                     = "osdisk1"
      os_disk_caching                  = "ReadWrite"
      os_disk_storage_account_type     = "Standard_LRS"
      source_image_reference_publisher = "Canonical"
      source_image_offer               = "UbuntuServer"
      source_image_sku                 = "18.04-LTS"
      source_image_version             = "latest"
      computer_name                    = "vm1"
      admin_username                   = "admin"
      ssh_timeout                      = 5
      file_source                      = "/path/to/source"
      file_destination                 = "/path/to/destination"
    },
    {
      name                             = "vm2"
      size                             = "Standard_DS2_v2"
      os_disk_name                     = "osdisk2"
      os_disk_caching                  = "ReadWrite"
      os_disk_storage_account_type     = "Standard_LRS"
      source_image_reference_publisher = "Canonical"
      source_image_offer               = "UbuntuServer"
      source_image_sku                 = "18.04-LTS"
      source_image_version             = "latest"
      computer_name                    = "vm2"
      admin_username                   = "admin"
      ssh_timeout                      = 5
      file_source                      = "/path/to/source"
      file_destination                 = "/path/to/destination"
    },
    {
      name                             = "vm3"
      size                             = "Standard_DS3_v2"
      os_disk_name                     = "osdisk3"
      os_disk_caching                  = "ReadWrite"
      os_disk_storage_account_type     = "Standard_LRS"
      source_image_reference_publisher = "Canonical"
      source_image_offer               = "UbuntuServer"
      source_image_sku                 = "18.04-LTS"
      source_image_version             = "latest"
      computer_name                    = "vm3"
      admin_username                   = "admin"
      ssh_timeout                      = 5
      file_source                      = "/path/to/source"
      file_destination                 = "/path/to/destination"
    }
  ]
}


