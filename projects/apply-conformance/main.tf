module "rgModule" {
    source = "../../modules/resourceGroup"

    rgName                                               = var.rgName
    location                                             = var.location
    environment                                          = var.environment
    projectcode                                          = var.projectcode
    dataclassification                                   = var.dataclassification
    securityprofile                                      = var.securityprofile
}


module "applicationInsights" {
  source = "../../modules/appInSights"

  appInsName                = local.appInsName
  location                  = var.location
  rgName                    = var.rgName
  applicationType           = var.applicationType
}


// Here goes the storage account creation


module "saCreation" {
  source  = "../../modules/storageAccount"

  saName                                                = local.saName
  rgName                                                = var.rgName
  location                                              = var.location
  accountTier                                           = var.accountTier
  accReplicationType                                    = var.accReplicationType
  enable_https_traffic_only                             = var.enable_https_traffic_only
  account_encryption_source                             = var.account_encryption_source

  default_action                                        = var.default_action
  bypassSa                                              = var.bypassSa
  iprulesSa                                             = var.iprulesSa

  environment                                           = var.environment
  projectcode                                           = var.projectcode
  dataclassification                                    = var.dataclassification
  securityprofile                                       = var.securityprofile

  enableAdvThreatProt                                   = var.enableAdvThreatProt

  containerAccessType                                   = var.containerAccessType

  storageContainer                                      = var.storageContainer
}

// Here goes the azure storage account sas creation


data "azurerm_storage_account_sas" "azfunctest-sas" {
    connection_string = module.saCreation.primary_connection_string
    https_only        = true
    resource_types {
        service   = true
        container = true
        object    = true
    }
    services {
        blob  = true
        queue = true
        table = true
        file  = true
    }
    start  = "2020-02-21"
    expiry = "2020-05-21"
    permissions {
        read    = true
        write   = true
        delete  = true
        list    = true
        add     = true
        create  = true
        update  = true
        process = true
    }
}


module "appserviceplan" {
  source  = "../../modules/appServicePlan"

  appServicePlan      = var.appServicePlan
  location            = var.location
  rgName              = var.rgName
  kind                = var.kind
  reserved            = var.reserved

  spskuTier = var.spskuTier
  spskuSize = var.spskuSize

  environment                = var.environment
  projectcode                = var.projectcode
  dataclassification         = var.dataclassification
  securityprofile            = var.securityprofile
}

module "functionapp" {
  source  = "../../modules/funcApp"

  funcAppName                                 = local.funcAppName
  location                                    = var.location
  rgName                                      = var.rgName
  planId                                      = module.appserviceplan.id
  saConnStr                                   = module.saCreation.primary_connection_string
  httpsFuncApp                                = var.httpsFuncApp
  funcAppVersion                              = var.funcAppVersion

  siteConfig_alwaysOn                     = var.siteConfig_alwaysOn
  linux_fx_version                        = var.linux_fx_version
  FuncWorkerRuntime                       = var.FuncWorkerRuntime
  enable_oryx_build                       = var.enable_oryx_build
  scm_do_build_during_deployment          = var.scm_do_build_during_deployment
  httpsFuncAppSettings                    = var.httpsFuncAppSettings
  insigntKey                              = module.applicationInsights.instrumentation_key
}


