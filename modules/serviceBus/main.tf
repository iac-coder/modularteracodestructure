/*
Here goes the resource group Creation
*/

resource "azurerm_resource_group" "rgtestsb" {
  name     = var.rgName
  location = var.location

  tags = {
    ProjectCode                                          = var.ProjectCode
    environment                                          = var.environment
    dataclassification                                   = var.dataclassification
    securityprofile                                      = var.securityprofile
  }

}

/*
Here goes the azure servicebus namespace creation
*/

resource "azurerm_servicebus_namespace" "testsbname" {
  name                = var.sbNamespace
  location            = azurerm_resource_group.rgtestsb.location
  resource_group_name = azurerm_resource_group.rgtestsb.name
  sku                 = var.sku

  tags = {
    ProjectCode                                          = var.ProjectCode
  }
}


/*
Here goes the azure servicebus topic1 creation
*/

resource "azurerm_servicebus_topic" "testrbtopic1" {
  name                = var.sbTopicName1
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  enable_partitioning = var.enable_partitioning_topic1
}


resource "azurerm_servicebus_subscription" "testsbsubscription1" {
  name                = var.sbsubscription1
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  topic_name          = azurerm_servicebus_topic.testrbtopic1.name
  max_delivery_count  = var.max_delivery_count1
}


/*
Here goes the azure servicebus topic2 creation
*/

resource "azurerm_servicebus_topic" "testrbtopic2" {
  name                = var.sbTopicName2
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  enable_partitioning = var.enable_partitioning_topic2
}


resource "azurerm_servicebus_subscription" "testsbsubscription2" {
  name                = var.sbsubscription2
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  topic_name          = azurerm_servicebus_topic.testrbtopic2.name
  max_delivery_count  = var.max_delivery_count2
}


/*
Here goes the azure servicebus topic3 creation
*/

resource "azurerm_servicebus_topic" "testrbtopic3" {
  name                = var.sbTopicName3
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  enable_partitioning = var.enable_partitioning_topic3
}


resource "azurerm_servicebus_subscription" "testsbsubscription3" {
  name                = var.sbsubscription3
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  topic_name          = azurerm_servicebus_topic.testrbtopic3.name
  max_delivery_count  = var.max_delivery_count3
}


/*
Here goes the azure servicebus topic4 creation
*/

resource "azurerm_servicebus_topic" "testrbtopic4" {
  name                = var.sbTopicName4
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  enable_partitioning = var.enable_partitioning_topic4
}


resource "azurerm_servicebus_subscription" "testsbsubscription4" {
  name                = var.sbsubscription4
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  topic_name          = azurerm_servicebus_topic.testrbtopic4.name
  max_delivery_count  = var.max_delivery_count4
}


/*
Here goes the azure servicebus topic5 creation
*/

resource "azurerm_servicebus_topic" "testrbtopic5" {
  name                = var.sbTopicName5
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  enable_partitioning = var.enable_partitioning_topic5
}


resource "azurerm_servicebus_subscription" "testsbsubscription5" {
  name                = var.sbsubscription5
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  topic_name          = azurerm_servicebus_topic.testrbtopic5.name
  max_delivery_count  = var.max_delivery_count5
}



/*
Here goes the azure servicebus queue creation
*/

resource "azurerm_servicebus_queue" "testsbqueue" {
  name                = var.sbQueue
  resource_group_name = azurerm_resource_group.rgtestsb.name
  namespace_name      = azurerm_servicebus_namespace.testsbname.name
  enable_partitioning = var.enable_partitioning_queue
}
