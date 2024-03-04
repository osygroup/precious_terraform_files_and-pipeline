terraform {
  #required_providers {
    #azurerm = {
      #source  = "hashicorp/azurerm"
      #version = "~>3.0"
    #}
  #}
  backend "azurerm" {
      #resource_group_name  = "tfstate"
      #storage_account_name = "<storage_account_name>"
      #container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
    features {}

    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
} 

variable "subscription_id" {
    description = "Enter Subscription ID for provisioning resources in Azure"
}

variable "client_id" {
    description = "Enter Client ID for application created in Azure AD i.e. App Registratrion"
}

variable "client_secret" {
    description = "Enter Client secret of application created in Azure AD"
}

variable "tenant_id" {
    description = "Enter Tenant ID of Azure AD"
}


