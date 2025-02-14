provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  storage_use_azuread             = true
  subscription_id                 = "57124af2-ec2e-466c-a744-c046ea95c09a"
}

## Create a resource group
resource "azurerm_resource_group" "temp_rg" {
  name     = "hashitalk-basic-sa-${random_pet.pet_name.id}-rg"
  location = "East US"
}

## Output the resource group name
output "rg_name" {
  value = azurerm_resource_group.temp_rg.name
}

## Create a random pet
resource "random_pet" "pet_name" {
  length = 1
}

## Output the random pet name
output "sa_pet_name" {
  value = random_pet.pet_name.id
}