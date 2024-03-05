# precious_terraform_files_and-pipeline

## Part I: Deliver Terraform Code

The directory _terraform_blobstorage_ contains the main.tf and variables.tf files used to create an Azure Storage Account and Storage Container. These resources were used to create a Helm repository needed for Part II of the assessment.


## Part III Setup an AKS cluster and Azure SQL Database 

The directory _terraform_aks_ contains the main.tf and variables.tf files used to create an AKS cluster running on two nodes and deployed into a new Azure Virtual Network. The Helm chart created for Part II of the assessment was deployed in this cluster.


The directory _terraform_sqldb_ contains the main.tf, outputs.tf and variables.tf files used to create an Azure SQL Database, with its required database server and other needed resources.
These terraform files ensure a more secure terraform deployment in which the admin_password protection for the Database Server is hidden.

Use _"terraform output -json"_ command to view the admin_password and other output vaules after applying the terraform script.


### Pipelines

The pipelines in the _.github/workflows_ directory are used for to manage the AKS infrastructure via terraform

_tf_plan_aks.yaml_ is used to run the _'terraform plan'_ command

_tf_apply_aks.yaml_ is used to run the _'terraform apply -auto-approve'_ command

_tf_destroy_aks.yaml_ is used to run the _'terraform destroy -auto-approve'_ command

Credentials used for connecting to the Backend container for management of the tfstate file and for connecting to the Azure subscription were managed by using GitHub Secrets to meet standard production practices.
