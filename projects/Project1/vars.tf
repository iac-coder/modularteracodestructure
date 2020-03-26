
locals {
    #Generate RG Name
    //rgName              =   "${var.org_prefix}-${var.dept_name}-rg-${var.env_name}-${var.incrCount}"

    #Genarate SA Name
    saName              =   "${var.org_prefix}${var.dept_name}sa${var.env_name}${var.incrCount}"
    
    #Generate Plan Name
    //appServicePlanName  =   "${var.org_prefix}-${var.dept_name}-plan-${var.env_name}-${var.incrCount}"

    #Generate FA Name
    funcAppName         =   "${var.org_prefix}-${var.dept_name}-fn-${var.env_name}-${var.incrCount}"

    #Generate Appinsights Name
    appInsName          =   "${var.org_prefix}${var.dept_name}ai${var.env_name}${var.incrCount}"
}


//variables_test.tf
variable "location" {
    type    =   string
    default =   "EastUS2"
}
variable "org_prefix" {
    type    =   string
    default =   "mkl"
}
variable "dept_name" {
    type    =   string
    default =   "ds"
}
variable "rgName" {
    type      = string
    default   = "mkl-ds-rg-edw-test-003"
}
variable "appServicePlan" {
    type    =   string
    default =   "mkl-ds-asp-edw-test-003"
}
variable "appInsName" {
    type      = string
    default   = "applyconf"
}
variable "saName" {
    type      = string
    default   = "applyconf"
}
variable "funcAppName" {
    type      = string
    default   = "apply-conformance"
}
variable "incrCount" {
    type    =   number
    default =   "003"
}
variable "env_name" {
    type    =   string
    default =   "test"
}


//resource group variables

//tags variables

variable "environment" {
    type      = string
    default   = "Development-ATeam"
}
variable "projectcode" {
    type      = string
    default   = "50220"
}
variable "dataclassification" {
    type      = string
    default   = "Confidential"
}
variable "securityprofile" {
    type      = string
    default   = "external"
}

//App service plan variables

variable "kind" {
    type    =   string
    default =   "Linux"
}
variable "reserved" {
    type    =   bool
    default =   true
}
variable "spskuTier" {
    type    =   string
    default =   "Premium"
}
variable "spskuSize" {
    type    =   string
    default =   "P2V2"
}

//application insights

variable "applicationType" {
    type      = string
    default   = "web"
}


//storage account variables

variable "accountTier" {
    type      = string
    default   = "standard"
}
variable "accReplicationType" {
    type      = string
    default   = "LRS"
}
variable "enable_https_traffic_only" {
    type      = bool
    default   = true
}
variable "account_encryption_source" {
    type      = string
    default   = "Microsoft.Storage"
}
variable "default_action" {
    type      = string
    default   = "Deny"
}
variable "bypassSa" {
    type      = list
    default   = ["AzureServices","Logging","Metrics"]
}
variable "iprulesSa" {
    type      = list
    default   = ["209.10.84.12","209.10.84.13"]
}
variable "enableAdvThreatProt" {
    type      = bool
    default   = true
}

// Storage Container variables

variable "storageContainer" {
    type      = string
    default   = "functionapp"
}

variable "containerAccessType" {
    type      = string
    default   = "private"
}

// FunctionApp Variables

variable "httpsFuncApp" {
    type    =   bool
    default =   true
}
variable "funcAppVersion" {
    type    =   string
    default =  "~2"
}
variable "siteConfig_alwaysOn" {
    type    =   string
    default =   true
}
variable "linux_fx_version" {
    type    =   string
    default = "DOCKER|mcr.microsoft.com/azure-functions/python:2.0-python3.7-appservice"
}
variable "FuncWorkerRuntime" {
    type    =   string
    default = "python"
}
variable "enable_oryx_build" {
    type    =   bool
    default =   true
}
variable "scm_do_build_during_deployment" {
    type    =   bool
    default =   true
}
variable "httpsFuncAppSettings" {
    type    =   bool
    default =   true
}
