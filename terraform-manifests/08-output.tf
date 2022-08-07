# Outputs required for get-credentials 
output "resource_group_aks" {
  value = azurerm_resource_group.aks_rg.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}


# output "azure_ad_group" {
#   value = azuread_group.aks_administrators.id
# }

# # AKS Outputs
# output "aks_cluster_id" {
#   value = azurerm_kubernetes_cluster.aks_cluster.id
# }

# output "aks_cluster_version" {
#   value = azurerm_kubernetes_cluster.aks_cluster.kubernetes_version
# }

# output "ak-subnet-name" {
#   value = azurerm_subnet.aks-default.name
# }