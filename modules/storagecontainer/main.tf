
resource "azurerm_storage_container" "storagecontainer" {
    name                                   = var.storageContainer
    resource_group_name                    = var.rgName
    storage_account_name                   = var.saName
    container_access_type                  = var.containerAccessType
    //depends_on                             = [azurerm_storage_account.storageaccount]
}
