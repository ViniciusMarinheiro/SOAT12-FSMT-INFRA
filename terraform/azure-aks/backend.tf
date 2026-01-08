terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-soat12" # <--- ATUALIZADO
    storage_account_name = "stterraformstate12soat" # <--- ATUALIZADO
    container_name       = "tfstate"
    key                  = "soat12-fsmt-infra.terraform.tfstate"
  }
}