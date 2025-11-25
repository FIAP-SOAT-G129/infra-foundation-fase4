# 🌐 Infraestrutura Base (Foundation)

Este repositório provê a fundação de rede para o projeto Fastfood, utilizando **Terraform** na AWS. São provisionados:

- VPC customizada
- Subnets públicas e privadas
- Internet Gateway (IGW)
- NAT Gateway
- Route Tables
- Repositórios ECR para microsserviços
- Integração com backend remoto S3
- Tags padronizadas

---

## 📦 Estrutura do Projeto

```text
infra-foundation-fase4/
│── main.tf                # Orquestração dos módulos principais
│── variables.tf           # Variáveis globais do projeto
│── terraform.tfvars       # Valores das variáveis (exceto secrets)
│── providers.tf           # Provider AWS
│── backend.tf             # Configuração do backend remoto S3
│── outputs.tf             # Saídas exportadas (VPC, subnets, etc)
│── modules/               # Módulos reutilizáveis
│   ├── vpc/               # Módulo de VPC
│   ├── subnets/           # Módulo de Subnets
│   ├── internet-gateway/  # Módulo de IGW
│   ├── nat-gateway/       # Módulo de NAT Gateway
│   ├── route-tables/      # Módulo de Route Tables
│   └── ecr/               # Módulo de ECR
```

---

## ⚙️ Pré-requisitos

- [Terraform >= 1.5](https://developer.hashicorp.com/terraform/downloads)
- AWS CLI configurado
- Permissões para criar recursos de rede (VPC, Subnets, IGW, NAT, etc)
- Backend S3 já configurado para armazenar o estado remoto

---

## 🚀 Como usar

### 1. Inicializar o Terraform

```bash
terraform init
```

### 2. Validar a configuração

```bash
terraform validate
```

### 3. Planejar alterações

```bash
terraform plan -var-file="terraform.tfvars"
```

### 4. Aplicar alterações

```bash
terraform apply -var-file="terraform.tfvars"
```

---

## 🔑 Backend remoto

O estado do Terraform (`terraform.tfstate`) é armazenado no bucket S3:

- **Bucket:** `fastfood-tf-states`
- **Folder:** `infra/foundation/`

A configuração está no arquivo `backend.tf`.

---

## 📤 Outputs

Após aplicar, os principais outputs incluem:

- **vpc_id** → ID da VPC criada
- **vpc_cidr_block** → CIDR da VPC
- **public_subnet_ids** → IDs das subnets públicas
- **private_subnet_ids** → IDs das subnets privadas

---

## 🏗️ Pipeline de Automação

O projeto utiliza pipelines CI/CD no GitHub Actions para automação, validação e aplicação da infraestrutura. Os principais workflows estão em `.github/workflows/`:

- **fmt-validate.yml**: Executa `terraform fmt` e `terraform validate` em PRs e pushes.
- **plan.yml**: Gera o plano de execução (`terraform plan`) para revisão.
- **apply.yml**: Aplica as alterações aprovadas (`terraform apply`).
- **destroy.yml**: Automatiza a destruição dos recursos.
- **destroy-terraform.yml**: Orquestra a destruição controlada via Terraform.
- **terraform.yml**: Workflow principal de CI/CD.

### Benefícios da automação

- Reduz erros manuais e aumenta a rastreabilidade
- Garante validação e revisão antes de qualquer alteração
- Permite auditoria e histórico de mudanças
- Facilita rollback e destruição controlada de recursos

Consulte cada arquivo em `.github/workflows/` para detalhes e personalizações.

---

Se precisar de exemplos de variáveis ou de outputs, consulte os arquivos `terraform.tfvars` e `outputs.tf` deste repositório.
