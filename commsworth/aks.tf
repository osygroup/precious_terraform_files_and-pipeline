resource "azurerm_kubernetes_cluster" "aks" {
  name                     = "${data.azurerm_resource_group.rg.name}-aks"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  dns_prefix               = "uataks"

  kubernetes_version       = var.kubernetes_version

  sku_tier = "Standard"

  default_node_pool {
    name       = "${data.azurerm_resource_group.rg.name}-aks-system"
    node_count = 1
    vm_size    = "Standard_D2ads_v7"
    os_disk_size_gb = 128
    max_pods = 250
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.0.2.0/24"
    dns_service_ip = "10.0.2.10"
    load_balancer_sku = "standard"
    #docker_bridge_cidr = "172.17.0.1/16"
  }

  identity {
    type = "SystemAssigned"
  }
  
  tags = var.tags
}


data "azurerm_container_registry" "acr_name" {
      name = "finsaasuat"
      resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_role_assignment" "acrroleassign" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.acr_name.id
  skip_service_principal_aad_check = true
}