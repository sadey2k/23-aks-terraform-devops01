# Resource group name
variable "aks_rg-name" {
  default = "aks-terraform"
}

variable "aks_location" {
  type        = string
  default     = "westus"
  description = "AKS cluster location"
}

### NOT USED HERE - REFERENCED IN DEVOPS PIPELINE ###
Environment variable
variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment to be deployed to"
}

# SSH key location 
variable "ssh_key" {
  ### NOT USED HERE - REFERENCED IN DEVOPS PIPELINE ###
  # default     = "C:/Users/Shola/.ssh/aks-prod-sshkeys/aksprodsshkey.pub"
  description = "ssh key location"
}


# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type        = string
  default     = "azureuser"
  description = "This variable defines the Windows admin username k8s Worker nodes"
}

# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type        = string
  default     = "L0nd0n12345!!!"
  description = "This variable defines the Windows admin password k8s Worker nodes"
}

