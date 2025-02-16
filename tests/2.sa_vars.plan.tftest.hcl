##############################################################################
# Setup RG for Storage Account Tests
run "setup_rg" {
  module {
    source = "./tests/setup"
  }
}

##############################################################################
# Global Variables - no need to repeat these in every run
variables {
  sa_name                  = "hashitalkbasic-${run.setup_rg.sa_pet_name}"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  environment              = "dev"
  cost_center              = "IT"
  rg_name                  = run.setup_rg.rg_name
}

##############################################################################
# Test Plan for Storage Account
run "create_bad_sa_name_chars" {
  command = plan
  variables {
    sa_name                  = "hashitalkbasic-${run.setup_rg.sa_pet_name}"
  }

  expect_failures = [var.sa_name]
}


# Test Plan for Storage Account - Name Length
run "create_bad_sa_name_length" {
  command = plan
  variables {
    sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}1234567890"
  }

  expect_failures = [var.sa_name]
}


# Test Plan for Storage Account - Location
run "create_bad_sa_location" {
  command = plan
  variables {
    location                 = "centralus"
    # location                 = "EuropeWest"
  }

  expect_failures = [var.location]
}


# Test Plan for Storage Account - Environment & Location
run "create_bad_sa_combo" {
  command = plan
  variables {
    location                 = "EuropeWest"
    environment              = "uat"
  }

  expect_failures = [var.environment, var.location]
}