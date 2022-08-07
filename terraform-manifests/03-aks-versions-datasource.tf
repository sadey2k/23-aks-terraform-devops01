# Datasource to get Latest Azure AKS latest Version
data "azurerm_kubernetes_service_versions" "current" {
  location = azurerm_resource_group.aks_rg.location
}

# output "latest_version" {
#   value = data.azurerm_kubernetes_service_versions.current.versions
#   # include_preview = false
# }


