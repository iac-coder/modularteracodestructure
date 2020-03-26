/*
azure keyvault
*/
variable "keyvault" {
    type      = string
    default   = "keyvault895674"
}
variable "tenant_id" {
    type      = string
    default   = "28e5a145-70c6-44e3-ba17-7b09d54fe531"
}
variable "enabled_for_deployment" {
    type      = string
    default   = "true"
}
variable "enabled_for_disk_encryption" {
    type      = string
    default   = "true"
}
variable "enabled_for_template_deployment" {
    type      = string
    default   = "true"
}
variable "skukeyvault" {
    type      = string
    default   = "standard"
}
variable "service_principal_object_id" {
    type      = string
    default   = "0442f7af-d144-402f-9e38-c40cbef927cd"
}
variable "objectId1" {
    type      = string
    default   = "57fd96c0-fd94-47b4-9e91-752c8dbf4a93"
}
variable "objectId2" {
    type      = string
    default   = "73dc4441-9b77-463d-b234-45cc7882ac29"
}
