# PagueBem — DynamoDB

Tabelas DynamoDB do projeto PagueBem.

## Tabelas

| Tabela | Hash Key | GSI | Descrição |
|--------|----------|-----|-----------|
| `Usuarios-{env}` | `usuario_id` (S) | — | Cadastro de usuários |
| `QrCodeItens-{env}` | `item_id` (S) | `qrcode_id-index` (qrcode_id) | Itens extraídos de QR Codes |

## Dependências

Nenhuma — este é o primeiro recurso a ser deployado.

## Deploy

```powershell
# Init (primeira vez ou troca de ambiente)
terraform init -backend-config="key=dynamodb/dev/terraform.tfstate"

# Plan
terraform plan -var-file="dev/terraform.tfvars"

# Apply
terraform apply -var-file="dev/terraform.tfvars"
```

## Destroy

```powershell
terraform destroy -var-file="dev/terraform.tfvars"
```

## Outputs

| Output | Descrição |
|--------|-----------|
| `usuarios_table_name` | Nome da tabela Usuarios |
| `usuarios_table_arn` | ARN da tabela Usuarios |
| `qrcode_itens_table_name` | Nome da tabela QrCodeItens |
| `qrcode_itens_table_arn` | ARN da tabela QrCodeItens |

> Copie os ARNs dos outputs para o `terraform.tfvars` do Lambda.
