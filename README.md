# SOAT12-FSMT-INFRA

## 📝 Descrição do Propósito
Este repositório é responsável por provisionar a infraestrutura base na Azure utilizando **Terraform**. Ele cria o alicerce do projeto: o **Resource Group** e o cluster **Azure Kubernetes Service (AKS)**.

## 🛠 Tecnologias Utilizadas
* **Terraform**: Infraestrutura como Código.
* **Azure AKS**: Orquestrador de containers.
* **GitHub Actions**: Pipeline de CI/CD.
* **OIDC**: Autenticação federada segura.

## 🚀 Passos para Execução e Deploy

### 💻 Execução Local
1. **Login no Azure**: `az login`
2. **Inicializar**: `terraform init`
3. **Planejar**: `terraform plan -out=main.tfplan`
4. **Aplicar**: `terraform apply "main.tfplan"`

### ☁️ Execução na Nuvem (CI/CD)
1. **GitHub Secrets**: Configure `AZURE_CLIENT_ID`, `AZURE_TENANT_ID` e `AZURE_SUBSCRIPTION_ID`.
2. **Deploy**: Realize um `push` para a branch `main`.
3. **Workflow**: O GitHub Actions executará o job `terraform apply` automaticamente após o sucesso do `plan`.
