variable "account_replication_type" {
  description = "The type of replication to use for this storage account"
  default     = "LRS"
  type        = string
}

variable "account_tier" {
  description = "The Tier to use for this storage account"
  default     = "Standard"
  type        = string
}

variable "cost_center" {
  description = "The cost center to use for this storage account"
  default     = "IT"
  type        = string
}

variable "environment" {
  description = "The environment to use for this storage account"
  default     = "dev"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "The environment must be one of dev, test, or prod"
  }
}

variable "sa_name" {
  description = "The name of the storage account"
  type        = string
  validation {
    condition     = length(var.sa_name) < 24
    error_message = "The storage account name must be less than 24 characters long"
  }

  validation {
    condition     = can(regex("^[a-z0-9]*$", var.sa_name))
    error_message = "The storage account name must be lowercase alphanumeric characters only"
  }
}

variable "location" {
  description = "The location/region where the storage account should be created"
  type        = string
  validation {
    condition     = contains(["eastus", "eastus2", "centralus", "northcentralus", "southcentralus", "westus", "westus2", "westus3"], var.location)
    error_message = "The location must be one of the United States based Azure regions: eastus, eastus2, centralus, northcentralus, southcentralus, westus, westus2, westus3"
  }
}

variable "rg_name" {
  description = "The name of the resource group in which to create the storage account"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID to use for the tests"
  type        = string
  default     = "57124af2-ec2e-466c-a744-c046ea95c09a"

}

