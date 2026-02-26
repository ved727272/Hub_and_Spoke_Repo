terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.60.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backend-rg"
    storage_account_name = "backendstg12354"
    container_name       = "my-container"
    key        = "raman-tfstate"

  }
  # backend "azurerm" {
  #   resource_group_name  = "dont-delete"
  #   storage_account_name = "dontdeletepls"
  #   container_name       = "my-container"
  #   key                  = "tfstate"

  # }
}

provider "azurerm" {
  features {
    # key_vault {
    #   purge_soft_delete_on_destroy = true
    # }
    # resource_group {
    #   prevent_deletion_if_contains_resources = true
    # }
  }
  subscription_id = "89ea6cde-b718-4376-9ae5-97e5654340e8"
  # subscription_id = "a952c7be-2375-401d-b046-6b79e69b7bf9"
}
