# provider "azurerm" {
#   features {}
#   resource_provider_registrations = "none"
#   storage_use_azuread             = true
#   subscription_id                 = var.subscription_id
# }

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }
}