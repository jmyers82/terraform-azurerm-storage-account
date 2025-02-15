run "setup_rg" {
  module {
    source = "./tests/setup"
  }
}


run "create_sa_stnd_apply" {
  command = apply
  variables {
    sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    environment              = "dev"
    cost_center              = "IT"
    rg_name                  = run.setup_rg.rg_name
  }
}


run "create_sa_change_tag_apply" {
  command = apply
  variables {
    sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    environment              = "prod"  ## Change from dev to prod
    cost_center              = "IT"
    rg_name                  = run.setup_rg.rg_name
  }
}
