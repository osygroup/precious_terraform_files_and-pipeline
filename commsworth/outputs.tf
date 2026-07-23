output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kube_config_command" {
  value = "az aks get-credentials --resource-group ${data.azurerm_resource_group.rg.name} --name ${azurerm_kubernetes_cluster.aks.name}"
}

output "fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}