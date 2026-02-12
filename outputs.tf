output "usuarios_table_name" {
  description = "Name of the Usuarios DynamoDB table"
  value       = aws_dynamodb_table.usuarios.name
}

output "usuarios_table_arn" {
  description = "ARN of the Usuarios DynamoDB table"
  value       = aws_dynamodb_table.usuarios.arn
}

output "qrcode_itens_table_name" {
  description = "Name of the QrCodeItens DynamoDB table"
  value       = aws_dynamodb_table.qrcode_itens.name
}

output "qrcode_itens_table_arn" {
  description = "ARN of the QrCodeItens DynamoDB table"
  value       = aws_dynamodb_table.qrcode_itens.arn
}
