
run "create_sa_mock_plan" {

  override_resource {
    target = azurerm_storage_account.sa
  }

  assert {
    condition     = azurerm_storage_account.sa.name == "mockresourcesa"
    error_message = "The storage account name must be the same as the default sa name"
  }

  # command = plan
  variables {
    sa_name                  = "mockresourcesa"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    environment              = "dev"
    cost_center              = "IT"
    rg_name                  = "mockedrg"
  }
}