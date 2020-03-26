//Advanced Threat protection

resource "azurerm_advanced_threat_protection" "advthreatprotection" {
  target_resource_id                     = azurerm_storage_account.storageaccount.id
  enabled                                = var.enableAdvThreatProt
}




