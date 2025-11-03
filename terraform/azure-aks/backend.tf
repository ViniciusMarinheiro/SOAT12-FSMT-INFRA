terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstatesoat12" # <--- ATUALIZADO
    container_name       = "tfstate"
    key                  = "soat12-fsmt-infra.terraform.tfstate"
  }
}