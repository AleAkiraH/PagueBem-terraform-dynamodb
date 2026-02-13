output "usuarios_table_name" {
  description = "Name of the PagueBem-Usuarios DynamoDB table"
  value       = aws_dynamodb_table.usuarios.name
}

output "usuarios_table_arn" {
  description = "ARN of the PagueBem-Usuarios DynamoDB table"
  value       = aws_dynamodb_table.usuarios.arn
}

output "produtos_table_name" {
  description = "Name of the PagueBem-Produtos DynamoDB table"
  value       = aws_dynamodb_table.produtos.name
}

output "produtos_table_arn" {
  description = "ARN of the PagueBem-Produtos DynamoDB table"
  value       = aws_dynamodb_table.produtos.arn
}
