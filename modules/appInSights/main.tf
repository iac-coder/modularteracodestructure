// Here goes Application insights module

resource "azurerm_application_insights" "appinsBlobApp" {
  name                                 = var.appInsName
  location                             = var.location
  resource_group_name                  = var.rgName
  application_type                     = var.applicationType
}
