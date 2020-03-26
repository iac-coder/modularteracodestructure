/*
Here goes the resource group variables
*/

variable "rgName" {
    type      = string
    default   = "servicebustest123"
}

variable "location" {
    type      = string
    default   = "eastus2"
}

variable "environment" {
    type      = string
    default   = "Development-ATeam"
}

variable "ProjectCode" {
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

/*
Here goes the servicebus namespace variables
*/


variable "sbNamespace" {
    type      = string
    default   = "sbnamespacetest231"
}

variable "sku" {
    type      = string
    default   = "Standard"
}

/*
Here goes the servicebus topic1 variables
*/

variable "sbTopicName1" {
    type      = string
    default   = "batch-file-detected"
}


variable "enable_partitioning_topic1" {
    type      = bool
    default   = false
}

variable "sbsubscription1" {
    type      = string
    default   = "All-Messages"
}


variable "max_delivery_count1" {
    type      = string
    default   = 10
}

/*
Here goes the servicebus topic2 variables
*/

variable "sbTopicName2" {
    type      = string
    default   = "error-processing"
}


variable "enable_partitioning_topic2" {
    type      = bool
    default   = false
}

variable "sbsubscription2" {
    type      = string
    default   = "All-Messages"
}


variable "max_delivery_count2" {
    type      = string
    default   = 10
}

/*
Here goes the servicebus topic3 variables
*/

variable "sbTopicName3" {
    type      = string
    default   = "jeff-test"
}


variable "enable_partitioning_topic3" {
    type      = bool
    default   = false
}

variable "sbsubscription3" {
    type      = string
    default   = "All-Messages"
}


variable "max_delivery_count3" {
    type      = string
    default   = 10
}

/*
Here goes the servicebus topic4 variables
*/

variable "sbTopicName4" {
    type      = string
    default   = "process-batch-file-completed"
}


variable "enable_partitioning_topic4" {
    type      = bool
    default   = false
}

variable "sbsubscription4" {
    type      = string
    default   = "All-Messages"
}


variable "max_delivery_count4" {
    type      = string
    default   = 10
}

/*
Here goes the servicebus topic5 variables
*/

variable "sbTopicName5" {
    type      = string
    default   = "validated-file-registry-inserted"
}


variable "enable_partitioning_topic5" {
    type      = bool
    default   = false
}

variable "sbsubscription5" {
    type      = string
    default   = "All-Messages"
}


variable "max_delivery_count5" {
    type      = string
    default   = 10
}


/*
Here goes the servicebus queue variables
*/

variable "sbQueue" {
    type      = string
    default   = "process-batch-file-completed2"
}


variable "enable_partitioning_queue" {
    type      = bool
    default   = false
}

