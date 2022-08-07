# ####################################################################
# # Linux nodepool resource
# ####################################################################
# resource "azurerm_kubernetes_cluster_node_pool" "linux_pool" {
#   name                  = "linuxpool"
#   mode                  = "User"
#   vm_size               = "Standard_D2_v2"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
#   orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
#   #availability_zones   = [1, 2, 3]
#   enable_auto_scaling = true
#   min_count           = 1
#   max_count           = 5
#   os_disk_size_gb     = 30
#   vnet_subnet_id      = azurerm_subnet.aks-default.id
#   priority            = "Regular"
#   node_labels = {
#     "nodepool-type" = "linux"
#     "environment"   = var.environment
#     "nodepoolos"    = "linux"
#     "App"           = "java-apps"
#   }

# }

# ####################################################################
# # Windows nodepool resource
# ####################################################################
# resource "azurerm_kubernetes_cluster_node_pool" "windows_pool" {
#   name                  = "win101"
#   mode                  = "User"
#   vm_size               = "Standard_D2_v2"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
#   orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
#   #availability_zones   = [1, 2, 3]
#   enable_auto_scaling = true
#   min_count           = 1
#   max_count           = 5
#   os_disk_size_gb     = 30
#   os_type             = "Windows"
#   vnet_subnet_id      = azurerm_subnet.aks-default.id
#   priority            = "Regular"
#   node_labels = {
#     "nodepool-type" = "windows"
#     "environment"   = var.environment
#     "nodepoolos"    = "windows"
#     "App"           = "dotnet-apps"
#   }

# }