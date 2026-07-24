resource "azurerm_virtual_network" "vnet" {

  name                = "${data.azurerm_resource_group.rg.name}-aks-vnet"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = var.location
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "aks" {

  name                 = "${data.azurerm_resource_group.rg.name}-aks-subnet"
  resource_group_name      = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.1.0/24"]
}
