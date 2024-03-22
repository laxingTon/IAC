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

variable "storage_name" {
  type        = string
  default     = "eppstorage"
  description = "storage-name"
}


variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "account-tier"
}

variable "replication_type" {
  type        = string
  default     = "LRS"
  description = "replication-type"
}

variable "sharename" {
  type        = string
  default     = "eppshare"
  description = "sharename"
}


variable "quota" {
  type        = number
  default     = 50
  description = "quota"
}

variable "id" {
  type        = string
  default     = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"
  description = "id"
}

variable "permissions" {
  type        = string
  default     = "rwdl"
  description = "permissions"
}

variable "expiry" {
  type        = string
  default     = "2019-07-02T10:38:21.0000000Z"
  description = "expiry"
}

variable "start" {
  type        = string
  default     = "2019-07-02T09:38:21.0000000Z"
  description = "start"
}

