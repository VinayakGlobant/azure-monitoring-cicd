terraform {
  required_version = ">= 1.4.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.75.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }

  backend "azurerm" {
    # Fill these during terraform init via -backend-config or set them here if preferred
    resource_group_name  = "tfstate-rg-monitoring"
    storage_account_name = "tfstatestoracct02"
    container_name       = "tfstate"
    key                  = "workbooks/terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  # If you register providers manually, you can skip auto-registration:
  # skip_provider_registration = true
}
