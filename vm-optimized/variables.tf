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
variable "vm" {
  type = map(object({
    name                    = string
    size                    = string
    os_disk_name            = string
    os_disk_caching         = string
    os_disk_storage_account = string
    src_image_publisher     = string
    src_image_offer         = string
    src_image_sku           = string
    src_image_version       = string
    computer_name           = string
    admin_username          = string
    ssh_timeout             = string
    file_source             = string
    file_destination        = string
  }))
  default = {
    vm = {
      name                    = "vm"
      size                    = "Standard_DS1_v2"
      os_disk_name            = "myOsDisk"
      os_disk_caching         = "ReadWrite"
      os_disk_storage_account = "Premium_LRS"
      src_image_publisher     = "Canonical"
      src_image_offer         = "0001-com-ubuntu-server-jammy"
      src_image_sku           = "22_04-lts-gen2"
      src_image_version       = "latest"
      computer_name           = "hostname"
      admin_username          = "azureadmin"
      ssh_timeout             = "4m"
      file_source             = "testfile.txt"
      file_destination        = "/home/azureadmin/"
    }
  }
}


# Define StorageAccount configuration for Additional Disk
  variable "additional" {
    type = map(object({
        diskname=string
        storage_account_type=string
        create_option=string
        disk_size_gb=number
    }))
    default = {
      disk = {
        diskname="epp-disk"
        storage_account_type="Standard_LRS"
        create_option="Empty"
        disk_size_gb=10
      }
    }
    
  }
 
# Define StorageAccount configuration for disk Attachment
  variable "disk" {
    type = map(object({
        lun=number
        caching=string
    }))
    default = {
      attachment = {
        lun=10
        caching="ReadWrite"
      }
    }
    
  }

