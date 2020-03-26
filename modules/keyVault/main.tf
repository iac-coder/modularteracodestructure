resource "azurerm_key_vault" "admtocloudkv" {
    name                                                = var.keyvault
    location                                            = azurerm_resource_group.myresourcegroup.location
    resource_group_name                                 = azurerm_resource_group.myresourcegroup.name
    tenant_id                                           = var.tenant_id
    enabled_for_deployment                              = var.enabled_for_deployment
    enabled_for_disk_encryption                         = var.enabled_for_disk_encryption
    enabled_for_template_deployment                     = var.enabled_for_template_deployment
    depends_on                                          = [azurerm_resource_group.myresourcegroup]

#Sku standard/premium
    sku {
        name                                            = var.skukeyvault
    }


    access_policy {
    tenant_id       = var.tenant_id
            #The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault.
        #Service principal, App registration account
    object_id      = var.service_principal_object_id
        certificate_permissions          = [
            "backup","create","delete","deleteissuers","get","getissuers","import","list","listissuers","managecontacts","manageissuers","purge","recover","restore","setissuers","update",
        ]
        key_permissions                  = [
            "backup","create","decrypt","delete","encrypt","get","import","list","purge","recover","restore","sign","unwrapKey","update","verify","wrapKey",
        ]
        secret_permissions               = [
            "backup","get","list","purge","recover","restore","set",
        ]
        storage_permissions              = [
            "backup","delete","deletesas","get","getsas","list","listsas","purge","recover","regeneratekey","restore","set","setsas","update",
        ]
  }
    access_policy {
        tenant_id     = var.tenant_id
        object_id     = var.objectId1
        certificate_permissions          = [
            "backup","create","delete","deleteissuers","get","getissuers","import","list","listissuers","managecontacts","manageissuers","purge","recover","restore","setissuers","update",
        ]
        key_permissions                  = [
            "backup","create","decrypt","delete","encrypt","get","import","list","purge","recover","restore","sign","unwrapKey","update","verify","wrapKey",
        ]
        secret_permissions               = [
            "backup","get","list","purge","recover","restore","set",
        ]
        storage_permissions              = [
            "backup","delete","deletesas","get","getsas","list","listsas","purge","recover","regeneratekey","restore","set","setsas","update",
        ]
    }

    access_policy {
        tenant_id     = var.tenant_id
        object_id     = var.objectId2
        certificate_permissions          = [
            "backup","create","delete","deleteissuers","get","getissuers","import","list","listissuers","managecontacts","manageissuers","purge","recover","restore","setissuers","update",
        ]
        key_permissions                  = [
            "backup","create","decrypt","delete","encrypt","get","import","list","purge","recover","restore","sign","unwrapKey","update","verify","wrapKey",
        ]
        secret_permissions               = [
            "backup","get","list","purge","recover","restore","set",
        ]
        storage_permissions              = [
            "backup","delete","deletesas","get","getsas","list","listsas","purge","recover","regeneratekey","restore","set","setsas","update",
        ]
}
    tags = {
      environment                                     = var.environment
      projectcode                                     = var.projectcode
      dataclassification                              = var.dataclassificationstrgacc
      securityprofile                                 = var.securityprofile
      expirationdate                                  = var.expirationdate
      owner                                           = var.owner
      supportEmail                                    = var.supportemail
      technicalowner                                  = var.technicalowner
}
        network_acls {
        bypass                                        = var.bypass
        default_action                                = var.default_action
        ip_rules                                      = var.iprulesKeyvault
    }
}  

// key-vault Diagnostic settings

  resource "azurerm_monitor_diagnostic_setting" "test" {
  name                                                = var.keyvaultDiagsettings
  target_resource_id                                  = azurerm_key_vault.admtocloudkv.id
  storage_account_id                                  = azurerm_storage_account.teststorage.id
  log_analytics_workspace_id                          = azurerm_log_analytics_workspace.test.id
  depends_on                                          = [azurerm_key_vault.admtocloudkv]


  log {
    category                                          = "AuditEvent"
    enabled                                           = true

    retention_policy {
      enabled                                         = true
      days                                            = "10"
    }
  }

  metric {
    category                                          = "AllMetrics"

    retention_policy {
      enabled                                         = true
      days                                            = "10"
    }
  }
}

// Enable Soft delete for Key vault


resource "null_resource" "key-vault-enable-soft-delete" {
  provisioner "local-exec" {
    command           = "az resource update --id $(az keyvault show --name ${azurerm_key_vault.admtocloudkv.name} -o tsv | awk '{print $1}') --set properties.enableSoftDelete=true"
    interpreter       = ["PowerShell", "-Command"]
  }
  depends_on          = [azurerm_key_vault.admtocloudkv]
}


// Enable Purge protection for Key vault


resource "null_resource" "key-vault-enable-purge-protection" {
  provisioner "local-exec" {
    command           = "az keyvault update --name ${azurerm_key_vault.admtocloudkv.name} --resource-group ${azurerm_resource_group.myresourcegroup.name} --enable-purge-protection true"
    interpreter       = ["PowerShell", "-Command"]
  }
  depends_on          = [azurerm_key_vault.admtocloudkv]
}
