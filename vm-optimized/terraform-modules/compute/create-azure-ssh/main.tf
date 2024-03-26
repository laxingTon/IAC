# Set the required Terraform version and providers
terraform {
  required_version = ">=0.12"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

# Define the Azure provider with enabled features
provider "azurerm" {
  features {}
}

# Define variables for the resource group location and ID
variable "rg_location" {}
variable "rg_id" {}

# Generate a random SSH key name
resource "random_pet" "ssh_key_name" {
  prefix    = "ssh"
  separator = ""
}

# Define resource actions for generating SSH public/private key pair
resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey", "privateKey"]
}

# Define the Azure API resource for SSH public key
resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = random_pet.ssh_key_name.id
  location  = var.rg_location
  parent_id = var.rg_id
}

# Output the generated SSH public and private keys
output "key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
}

output "key_data_private" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).privateKey
}
