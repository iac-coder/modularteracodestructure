
//App service plan variables

variable "appServicePlan" {
    type    =   string
}
variable "location" {
    type    =   string
}
variable "rgName" {
    type    =   string
}
variable "kind" {
    type    =   string
}
variable "reserved" {
    type    =   bool
}
variable "spskuTier" {
    type    =   string
}
variable "spskuSize" {
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