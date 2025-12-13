terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Configuração do Backend para salvar o estado na Azure
  # Isso permite que o GitHub Actions funcione sem quebrar o estado
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-soat12"
    storage_account_name = "stterraformstate12soat"
    container_name       = "tfstate"
    key                  = "aks.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Resource Group do Cluster
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location # Lembre-se que no variables.tf deve estar "eastus2"
}

# Cluster Kubernetes (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-fsmt"

  default_node_pool {
    name       = "default"
    node_count = var.node_count # Deve ser 1 para economizar cota
    
    # "Standard_D2s_v3" foi a que funcionou na sua cota em East US 2
    vm_size    = "Standard_D2s_v3" 
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
    Project     = "FSMT-SOAT"
  }
}