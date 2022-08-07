# Networking resource group
resource "azurerm_resource_group" "aks_network_rg" {
  name     = "aks-network-rg"
  location = var.aks_location
  tags = {
    "environment" = "dev"
  }
}

# Create Virtual Network
resource "azurerm_virtual_network" "aksvnet" {
  name                = "aks-network"
  location            = azurerm_resource_group.aks_network_rg.location
  resource_group_name = azurerm_resource_group.aks_network_rg.name
  address_space       = ["10.0.0.0/8"]
}

# Create a Subnet for AKS nodepools
resource "azurerm_subnet" "aks-default" {
  name                 = "aks-default-subnet"
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  resource_group_name  = azurerm_resource_group.aks_network_rg.name
  address_prefixes     = ["10.240.0.0/16"]
}






# # Linux noodpool subnet
# resource "azurerm_subnet" "linux_node_subnet" {
#   name                 = "aks-linuxpool-subnet"
#   resource_group_name  = azurerm_resource_group.aks_network_rg.name
#   virtual_network_name = azurerm_virtual_network.aksvnet.name
#   address_prefixes     = ["10.240.0.0/16"]

# }

# # Windows noodpool subnet
# resource "azurerm_subnet" "windows_node_subnet" {
#   name                 = "aks-windowspool-subnet"
#   resource_group_name  = azurerm_resource_group.aks_network_rg.name
#   virtual_network_name = azurerm_virtual_network.aksvnet.name
#   address_prefixes     = ["10.240.0.0/16"]

# }

