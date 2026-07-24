variable "location" {
  default = "West Europe"
}

#variable "resource_group_name" {
#  default = "FinSaas-UAT"
#}

#variable "cluster_name" {
#  default = "FinSaas-UAT-aks"
#}

variable "kubernetes_version" {
  default = "1.34"
}

variable "tags" {
  type = map(string)

  default = {
    Environment = "UAT"
    ManagedBy   = "Terraform"
  }
}
