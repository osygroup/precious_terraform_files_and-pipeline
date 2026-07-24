terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }

    #random = {
      #source  = "hashicorp/random"
      #version = "~>3.7"
    #}
  }

  backend "azurerm" {
      #resource_group_name  = "tfstate"
      #storage_account_name = "<storage_account_name>"
      #container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

}