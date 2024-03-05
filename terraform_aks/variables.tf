terraform {

# Terraform strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
# I don't usually set this in the past, so that the latest version of Azure Provider is set automatically

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
  backend "azurerm" {
      #resource_group_name  = "tfstate"
      #storage_account_name = "<storage_account_name>"
      #container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
    features {}

} 
