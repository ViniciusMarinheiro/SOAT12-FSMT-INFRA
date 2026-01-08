resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  # Fixado o nome real para evitar destruição
  name                = "aks-fsmt"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  # Fixado o prefixo real
  dns_prefix          = "aks-fsmt"

  default_node_pool {
    name       = "default"
    # Fixado em 1 para manter o custo atual
    node_count = 1
    # Mantendo o tamanho que já estava no seu arquivo
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  # --- ADDONS (Para evitar que o Terraform remova) ---

  # 1. Mantém o Key Vault Provider
  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  # 2. Mantém o Web App Routing
  web_app_routing {
    dns_zone_ids = []
  }

# 3. Mantém o Application Gateway Ingress
  ingress_application_gateway {
    gateway_id = "/subscriptions/f7d27922-1c73-49da-9ba7-91605016204a/resourceGroups/MC_rg-fsmt-soat12_aks-fsmt_eastus2/providers/Microsoft.Network/applicationGateways/ingress-appgateway"
  }

  # --- FIM ADDONS ---

  tags = {
    Environment = "Development"
  }
}