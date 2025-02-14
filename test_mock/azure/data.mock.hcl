

mock_data "azurerm_storage_account" {
    defaults = {
        name = "mockdatasa"
    }
}

mock_resource "azurerm_storage_account" {
    defaults = {
        name = "mockresourcesa"
    }
}

