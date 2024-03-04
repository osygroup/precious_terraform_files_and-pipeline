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

variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
  default     = "eastus"
}


variable "sql_db_name" {
  type        = string
  description = "The name of the SQL Database."
  default     = "SampleDB"
}

variable "admin_username" {
  type        = string
  description = "The administrator username of the SQL logical server."
  default     = "azureadmin"
}

variable "admin_password" {
  type        = string
  description = "The administrator password of the SQL logical server."
  sensitive   = true
  default     = null
}
