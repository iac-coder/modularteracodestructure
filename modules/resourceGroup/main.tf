resource "azurerm_resource_group" "example" {
    name     = var.rgName
    location = var.location

    tags = {
      environment                                          = var.environment
      projectcode                                          = var.projectcode
      dataclassification                                   = var.dataclassification
      securityprofile                                      = var.securityprofile
  }
}