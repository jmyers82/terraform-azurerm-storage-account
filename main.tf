resource "azurerm_storage_account" "sa" {
  name                          = var.sa_name
  resource_group_name           = var.rg_name
  location                      = var.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  public_network_access_enabled = false

  tags = {
    environment = var.environment
    cost_center = var.cost_center
  }
}

resource "azurerm_private_endpoint" "blob_pe" {
  name                = "hashitalks-blob-pe"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.private_endpoint_subnet_id # <------ Need to gather this or create it!

  private_service_connection {
    name                           = "blob-connection"
    private_connection_resource_id = azurerm_storage_account.sa.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "storage-blob-zone-group"
    private_dns_zone_ids = [var.private_endpoint_zone_id] # <------ Need to gather this or create it!
  }
}
