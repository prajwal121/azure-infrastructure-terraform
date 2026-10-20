terraform {
  backend "azurerm" {
    resource_group_name  = "MyResourceGroup"
    storage_account_name = "mystorageaccount3577"
    container_name       = "miniproject-1"
    key                  = "dev.terraform.miniproject-1"
  }
}