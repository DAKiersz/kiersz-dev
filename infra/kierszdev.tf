locals {
  name        = "kierszdev"
  location    = "westeurope"
  environment = "prod"
  common_tags = {
    project     = "kierszdev"
    environment = "prod"
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.name}-${local.environment}-${local.location}"
  location = local.location
  tags     = local.common_tags
}

# Azure Static Web App
resource "azurerm_static_site" "staticsite" {
  name                = "swp-${local.name}-${local.environment}-${local.location}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = local.common_tags
  sku_size            = "Free"
  sku_tier            = "Free"
}

# Azure Application Insights
resource "azurerm_application_insights" "appinsights" {
  name                = "appinsights-${local.name}-${local.environment}-${local.location}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
  tags                = local.common_tags
}
