# SOAT12-FSMT-INFRA

## 📌 Propósito
Este repositório é responsável pelo provisionamento e gestão da infraestrutura como código (IaC) na Azure. Ele garante que o ambiente de execução (AKS), o registro de imagens (ACR) e o banco de dados estejam configurados corretamente para suportar os serviços da aplicação.

## 🛠️ Tecnologias Utilizadas
* **Terraform**: Orquestração e provisionamento de infraestrutura.
* **Azure Kubernetes Service (AKS)**: Cluster gerenciado para orquestração de containers.
* **Azure Container Registry (ACR)**: Registro privado para imagens Docker.
* **GitHub Actions**: Automação do provisionamento via pipeline CI/CD.

## 🚀 Passos para Execução e Deploy
1. **Configuração de Segredos**: Configure o segredo `AZURE_CREDENTIALS` no GitHub com o JSON gerado via Azure CLI.
2. **Provisionamento**: Realize o push para a branch `main` para disparar o `terraform apply`.
3. **Conexão Local**: Para gerenciar o cluster localmente, utilize:
   ```powershell
   az aks get-credentials --resource-group rg-fsmt-soat12 --name aks-fsmt
