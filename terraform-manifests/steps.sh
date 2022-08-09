######################################################################
# Step 1
######################################################################
# 01-main.tf
Comment Terraform Backend, because we are going to configure that in Azure DevOps

Comment out SSH info as will be using DevOps secure files for this 

######################################################################
# Step 2 Creete Repo
######################################################################
# Copy files, Initialize Local Repo, Push to Remote Git Repo
# Create folder in local deskop
cd azure-devops-aks-demo-repos
mkdir azure-devops-aks-kubernetes-terraform-pipeline
cd azure-devops-aks-kubernetes-terraform-pipeline

# Copy folders from Git-Repo-Files folder to new folder created in local desktop
kube-manifests
terraform-manifests
pipeline-backups


# Initialize Git Repo
cd azure-devops-aks-kubernetes-terraform-pipeline
git init

# Add Files & Commit to Local Repo
git add .
git commit -am "First Commit"

# Add Remote Origin and Push to Remote Repo
git remote add origin https://github.com/stacksimplify/azure-devops-aks-kubernetes-terraform-pipeline.git
git push --set-upstream origin master 

######################################################################
# Step 3 Create Service Principle
######################################################################
# Create a Service Principle in DevOps 
# Provide additional permissions to create resources in Azure AD
# Give API permission in AD graph 

##### VERY IMPORTANT FIX: Provide Permission to create Azure AD Groups #####
Provide permission for Service connection created in previous step to create Azure AD Groups
Go to -> Azure DevOps -> Select Organization -> Select project terraform-azure-aks
Go to Project Settings -> Pipelines -> Service Connections
Open tservice connection name
Click on Manage Service Principal, new tab will be opened
Click on View API Permissions
Click on Add Permission
Select an API: Microsoft APIs
Commonly used Microsoft APIs: Supported legacy APIs: Azure Active Directory Graph-DEPRECATING Use Microsoft Graph
Click on Application Permissions
Check Directory.ReadWrite.All and click on Add Permission
Click on Grant Admin consent for Default Directory


######################################################################
# Step 4 Create SSH Public Key for Linux VMs
######################################################################

Create SSH Public Key for Linux VMs
Create this out of your git repository
Important Note: We should not have these files in our git repos for security Reasons
# Create Folder
mkdir $HOME/ssh-keys-teerraform-aks-devops

# Create SSH Keys
ssh-keygen \
    -m PEM \
    -t rsa \
    -b 4096 \
    -C "azureuser@myserver" \
    -f ~/ssh-keys-teerraform-aks-devops/aks-terraform-devops-ssh-key-ububtu \

Note: We will have passphrase as : empty when asked

# List Files
ls -lrt $HOME/ssh-keys-teerraform-aks-devops
Private File: aks-terraform-devops-ssh-key-ububtu (To be stored safe with us)
Public File: aks-terraform-devops-ssh-key-ububtu.pub (To be uploaded to Azure DevOps)


######################################################################
# Step 5 Upload file to Azure DevOps as Secure File
######################################################################

Go to Azure DevOps -> aksdemo2 -> terraform-azure-aks -> Pipelines -> Library
Secure File -> Upload file named aks-terraform-devops-ssh-key-ububtu.pub
Open the file and click on Pipeline permissions -> Authorize for use in all pipelines
Click on SAVE