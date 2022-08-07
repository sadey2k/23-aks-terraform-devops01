# AD user to add to AD group
data "azuread_user" "admin_user" {
  user_principal_name = "aksadmin4@sadey2kyahoo.onmicrosoft.com"
}

# Create AD group 
resource "azuread_group" "aks_administrators" {
  display_name     = "${azurerm_resource_group.aks_rg.name}-cluster-administrators"
  security_enabled = true
  description      = "Azure AKS admins for ${azurerm_resource_group.aks_rg.name}-cluster-administrators"
}

# Add existing AD user to AD group
resource "azuread_group_member" "aks_admin_members" {
  group_object_id  = azuread_group.aks_administrators.id
  member_object_id = data.azuread_user.admin_user.id
}