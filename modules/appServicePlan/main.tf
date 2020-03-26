// Here goes the app service plan creation

resource "azurerm_app_service_plan" "appserviceplan" {
name                           = var.appServicePlan
location                       = var.location
resource_group_name            = var.rgName
kind                           = var.kind
reserved                       = var.reserved

sku {
    tier                       = var.spskuTier
    size                       = var.spskuSize
    }

tags = {
    environment                = var.environment
    projectcode                = var.projectcode
    dataclassification         = var.dataclassification
    securityprofile            = var.securityprofile
    }
}