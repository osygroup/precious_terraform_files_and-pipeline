resource "azurerm_resource_group" "helmdemo" {
  name     = "helm_tf_demo"
  location = "West Europe"
}

resource "azurerm_storage_account" "helmdemo" {
  name                     = "helmdemo"
  resource_group_name      = azurerm_resource_group.helmdemo.name
  location                 = azurerm_resource_group.helmdemo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Cool"  
  
  tags = {
    environment = "production"
  }
}

resource "azurerm_storage_container" "helmdemo" {
  name                  = "helmdemo"
  storage_account_name  = azurerm_storage_account.helmdemo.name
  container_access_type = "container"
}

