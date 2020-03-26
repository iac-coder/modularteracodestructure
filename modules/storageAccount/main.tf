
// Here goes the storage account creation



resource "azurerm_storage_account" "storageaccount" {
  name                                   = var.saName
  resource_group_name                    = var.rgName
  location                               = var.location
  account_tier                           = var.accountTier
  account_replication_type               = var.accReplicationType
  enable_https_traffic_only              = var.enable_https_traffic_only
  account_encryption_source              = var.account_encryption_source

  network_rules {
    default_action                       = var.default_action
    bypass                               = var.bypassSa
    ip_rules                             = var.iprulesSa
  }

  tags = {
    environment                          = var.environment
    projectcode                          = var.projectcode
    dataclassification                   = var.dataclassification
    securityprofile                      = var.securityprofile

  }
}

resource "azurerm_advanced_threat_protection" "advthreatprotection" {
  target_resource_id                     = azurerm_storage_account.storageaccount.id
  enabled                                = var.enableAdvThreatProt
  depends_on                             = [azurerm_storage_account.storageaccount]
}

// Here goes the storage container creation


resource "azurerm_storage_container" "storagecontainer" {
    name                                   = var.storageContainer
    resource_group_name                    = var.rgName
    storage_account_name                   = var.saName
    container_access_type                  = var.containerAccessType
    depends_on                             = [azurerm_storage_account.storageaccount]
}

// Here goes the azure storage account sas creation


# data "azurerm_storage_account_sas" "storageaccountsas" {
#     connection_string     = azurerm_storage_account.storageaccount.primary_connection_string
#     depends_on            = [azurerm_storage_account.storageaccount]
#     https_only            = true
#     resource_types {
#         service      = true
#         container    = true
#         object       = true
#     }
#     services {
#         blob         = true
#         queue        = true
#         table        = true
#         file         = true
#     }
#     start            = "2020-03-21"
#     expiry           = "2020-06-21"
#     permissions {
#         read         = true
#         write        = true
#         delete       = true
#         list         = true
#         add          = true
#         create       = true
#         update       = true
#         process      = true
#     }
# }