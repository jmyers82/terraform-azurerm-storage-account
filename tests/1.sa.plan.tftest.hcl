#################################################
# Setup RG for Storage Account Tests
run "setup_rg" {
  module {
    source = "./tests/setup"
  }
}

#################################################
# Test Plan for Storage Account
run "create_sa_plan" {
  command = plan
  variables {
    sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    environment              = "dev"
    cost_center              = "IT"
    rg_name                  = run.setup_rg.rg_name
  }

  # Validate the Storage Account Name
  assert {
    condition     = azurerm_storage_account.sa.name == "hashitalkbasic${run.setup_rg.sa_pet_name}"
    error_message = "Storage account name is incorrect"
  }

  # assert {
  #   condition     = output.sa_primary_access_key.value != null
  #   error_message = "Primary access key is null"
  # }
}