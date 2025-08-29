terraform {
  required_version = ">= 1.0"

  backend "azurerm" {
    resource_group_name  = "aztfgh_poc_rg"
    storage_account_name = "aztfghpoc"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth = true
  }  

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

provider "azurerm" {
  features {}
}