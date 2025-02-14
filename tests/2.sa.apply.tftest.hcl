run "setup_rg" {
  module {
    source = "./tests/setup"
  }
}


run "create_sa_apply" {
  command = apply
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
