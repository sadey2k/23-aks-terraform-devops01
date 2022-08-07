###################################
### Provider ###
###################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
            prevent_deletion_if_contains_resources = false # allow for deletion of resource group 
    }
  }
}

### confirgured in DevOps ###
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "aks-resources-rg"
#     storage_account_name = "storageaccountshola"
#     container_name       = "tfstate"
#     key                  = "dev-terraform.tfstate"
#   }
# }

resource "random_pet" "aks_randon" {
  length = 3

}