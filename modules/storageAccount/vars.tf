//resource group variables

variable "rgName" {
    type    = string
}
variable "location" {
    type    =   string
}

//tags variables

variable "environment" {
    type      = string
}
variable "projectcode" {
    type      = string
}
variable "dataclassification" {
    type      = string
}
variable "securityprofile" {
    type      = string
}



//storage account variables

variable "saName" {
    type    = string
}

variable "accountTier" {
    type      = string
}
variable "accReplicationType" {
    type      = string
}
variable "enable_https_traffic_only" {
    type      = bool
}
variable "account_encryption_source" {
    type      = string
}
variable "default_action" {
    type      = string
}
variable "bypassSa" {
    type      = list
}
variable "iprulesSa" {
    type      = list
}
variable "enableAdvThreatProt" {
    type      = bool
}

// Storage Container variables

variable "storageContainer" {
    type      = string
}

variable "containerAccessType" {
    type      = string
}