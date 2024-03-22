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

variable "namespace-name" {
  type        = string
  default     = "epp-namespace"
  description = "Name of the resource group."
}

variable "namespace-sku" {
  type        = string
  default     = "Standard"
  description = "Name of the resource group."
}

variable "namespace-capacity" {
  type        = number
  default     = 1
  description = "Name of the resource group."
}


variable "namespace-env" {
  type        = string
  default     = "Prod"
  description = "Name of the resource group."
}


variable "partition" {
  type        = number
  default     = 2
  description = "Name of the resource group."
}

variable "msg" {
  type        = number
  default     = 1
  description = "Name of the resource group."
}


variable "eventhub-name" {
  type        = string
  default     = "epp-namespace"
  description = "Name of the resource group."
}


