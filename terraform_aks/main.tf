resource "azurerm_resource_group" "example" {
  name     = "AKSdemoRG"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "aksVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "aksSubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes    = ["10.0.1.0/24"]
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "AKSCluster"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.0.2.0/24"
    dns_service_ip = "10.0.2.10"
    docker_bridge_cidr = "172.17.0.1/16"
  }

  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    Environment = "Production"
  }
}

# Attach an already-existing ACR to the AKS cluster
# I did not import the already-existing ACR before applying this tf file with:
# terraform import azurerm_container_registry.example /subscriptions/f3a......
# I just got the ID of the ACR so I can do the attachment on it

#resource "azurerm_container_registry" "example" {
  #name                = "osygroup"
  #resource_group_name = "helm_tf_demo"
  #location            = "West Europe"
  #sku                 = "Basic"
#}

data "azurerm_container_registry" "acr_name" {
      name = "osygroup"
      resource_group_name = "helm_tf_demo"
}

resource "azurerm_role_assignment" "example" {
  principal_id                     = azurerm_kubernetes_cluster.example.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.acr_name.id
  #scope                            = azurerm_container_registry.example.id
  skip_service_principal_aad_check = true
}
