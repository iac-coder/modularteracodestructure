resource "azurerm_function_app" "functionapp" {
name                                        = var.funcAppName
location                                    = var.location
resource_group_name                         = var.rgName
app_service_plan_id                         = var.planId
storage_connection_string                   = var.saConnStr
https_only                                  = var.httpsFuncApp
version                                     = var.funcAppVersion

site_config {
    always_on                               = var.siteConfig_alwaysOn
    linux_fx_version                        = var.linux_fx_version
    cors { 
    allowed_origins                         = ["https://functions.azure.com", "https://functions-staging.azure.com", "https://functions-next.azure.com"]
  }
}

app_settings = {
    FUNCTIONS_WORKER_RUNTIME                = var.FuncWorkerRuntime
    ENABLE_ORYX_BUILD                       = var.enable_oryx_build
    SCM_DO_BUILD_DURING_DEPLOYMENT          = var.scm_do_build_during_deployment
    https_only                              = var.httpsFuncAppSettings
    APPINSIGHTS_INSTRUMENTATIONKEY          = var.insigntKey
}
}