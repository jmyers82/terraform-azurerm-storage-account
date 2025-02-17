# Azure Provder
provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  storage_use_azuread             = true
  subscription_id                 = local.subscription_id
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

#################################################
# Setup RG for Storage Account Tests
# Create a random pet
resource "random_pet" "pet_name" {
  length = 1
}

# Create a resource group
resource "azurerm_resource_group" "temp_rg" {
  name     = "hashitalk-basic-sa-${random_pet.pet_name.id}-rg"
  location = "East US"
}

################### OUTPUTS ####################
## Output the resource group name
output "rg_name" {
  value = azurerm_resource_group.temp_rg.name
}

## Output the random pet name
output "sa_pet_name" {
  value = random_pet.pet_name.id
}














# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_subnet" "endpoint" {
#   name                 = "endpoint"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.2.0/24"]

# }