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
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  environment              = "dev"
  cost_center              = "IT"
}

# Test Plan for Storage Account
run "create_sa_stnd_apply" {
  variables {
    sa_name = "hashitalkbasic${run.setup_rg.sa_pet_name}"
    rg_name = run.setup_rg.rg_name

  }
}

# Test Plan for Storage Account - Change Tag
run "create_sa_change_tag_apply" {
  command = apply
  variables {
    environment = "prod" ## Change from dev to prod
    sa_name     = "hashitalkbasic${run.setup_rg.sa_pet_name}"
    rg_name     = run.setup_rg.rg_name

  }
}
