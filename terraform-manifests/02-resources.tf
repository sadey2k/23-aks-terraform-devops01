# AKS rersource group 
resource "azurerm_resource_group" "aks_rg" {
  name     = "${var.aks_rg-name}-${var.environment}-rg"
  location = var.aks_location
}
