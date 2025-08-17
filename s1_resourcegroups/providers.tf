terraform {
  required_version = ">= 1.9, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.117"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.14" # check latest version
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {
  # No arguments required if you use the same auth as azurerm
}