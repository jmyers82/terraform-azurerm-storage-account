run "setup_rg" {
  module {
    source = "./tests/setup"
  }
}

run "create_sa_plan" {
  command = plan
  variables {
    sa_name                    = "hashitalkbasic${run.setup_rg.sa_pet_name}"
    location                   = "eastus"
    account_tier               = "Standard"
    account_replication_type   = "LRS"
    environment                = "dev"
    cost_center                = "IT"
    rg_name                    = run.setup_rg.rg_name
    private_endpoint_subnet_id = "/subscriptions/57124af2-ec2e-466c-a744-c046ea95c09a/resourceGroups/hashitalks-network/providers/Microsoft.Network/virtualNetworks/hashitalks-vnet/subnets/private-endpoints"
    private_endpoint_zone_id   = "/subscriptions/57124af2-ec2e-466c-a744-c046ea95c09a/resourceGroups/hashitalks-network/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
  }
}



run "create_bad_sa_name_chars" {
  command = plan
  variables {
    sa_name                  = "hashitalkbasic-${run.setup_rg.sa_pet_name}"
    location                 = "eastus"
    account_tier             = "Premium"
    account_replication_type = "GRS"
    environment              = "dev"
    cost_center              = "IT"
    rg_name                  = run.setup_rg.rg_name
  }

  # expect_failures = [var.sa_name]

}

run "create_bad_sa_name_length" {
  command = plan
  variables {
    sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}1234567890"
    location                 = "eastus"
    account_tier             = "Premium"
    account_replication_type = "GRS"
    environment              = "dev"
    cost_center              = "IT"
    rg_name                  = run.setup_rg.rg_name
  }

  expect_failures = [var.sa_name]

}

run "create_bad_sa_location" {
  command = plan
  variables {
    sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}"
    location                 = "EuropeWest"
    account_tier             = "Premium"
    account_replication_type = "LZRS"
    environment              = "dev"
    cost_center              = "IT"
    rg_name                  = run.setup_rg.rg_name
  }

  expect_failures = [var.location]

}

run "create_bad_sa_combo" {
  command = plan
  variables {
    sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}"
    location                 = "EuropeWest"
    account_tier             = "Premium"
    account_replication_type = "LZRS"
    environment              = "uat"
    cost_center              = "IT"
    rg_name                  = run.setup_rg.rg_name
  }

  expect_failures = [var.environment, var.location]

}