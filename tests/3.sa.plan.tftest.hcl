
# mock_provider "azurerm" {
#   source = "./test_mock/azure"
#   alias  = "mock"
# }


# run "create_sa_mock_plan" {

#   providers = {
#     azurerm = azurerm.mock
#   }

#   assert {
#     condition = azurerm_storage_account.sa.name == "mockbsa"
#     error_message = "The storage account name must be the same as the default sa name"
#   }

#   # command = plan
#   variables {
#     sa_name                  = "mockbsa"
#     location                 = "eastus"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#     environment              = "dev"
#     cost_center              = "IT"
#     rg_name                    = "mockedrg"
#     private_endpoint_subnet_id = "/subscriptions/57124af2-ec2e-466c-a744-c046ea95c09a/resourceGroups/hashitalks-network/providers/Microsoft.Network/virtualNetworks/hashitalks-vnet/subnets/private-endpoints"
#     private_endpoint_zone_id   = "/subscriptions/57124af2-ec2e-466c-a744-c046ea95c09a/resourceGroups/hashitalks-network/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
#   }
# }