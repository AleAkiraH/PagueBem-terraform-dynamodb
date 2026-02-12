terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "paguebem-terraform-state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
    # key é passado via -backend-config="key=..." no terraform init
    # Dev:  dynamodb/dev/terraform.tfstate
    # Prod: dynamodb/prod/terraform.tfstate
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "Terraform"
      Repository  = "PagueBem-terraform-dynamodb"
    }
  }
}

# =============================================================================
# Tabela: Usuarios
# =============================================================================
resource "aws_dynamodb_table" "usuarios" {
  name         = "Usuarios-${var.environment}"
  billing_mode = var.billing_mode
  hash_key     = "usuario_id"

  attribute {
    name = "usuario_id"
    type = "S"
  }

  point_in_time_recovery {
    enabled = var.enable_pitr
  }

  server_side_encryption {
    enabled = true
  }

  tags = {
    Name = "Usuarios-${var.environment}"
  }
}

# =============================================================================
# Tabela: QrCodeItens
# =============================================================================
resource "aws_dynamodb_table" "qrcode_itens" {
  name         = "QrCodeItens-${var.environment}"
  billing_mode = var.billing_mode
  hash_key     = "item_id"

  attribute {
    name = "item_id"
    type = "S"
  }

  attribute {
    name = "qrcode_id"
    type = "S"
  }

  global_secondary_index {
    name            = "qrcode_id-index"
    hash_key        = "qrcode_id"
    projection_type = "ALL"
  }

  point_in_time_recovery {
    enabled = var.enable_pitr
  }

  server_side_encryption {
    enabled = true
  }

  tags = {
    Name = "QrCodeItens-${var.environment}"
  }
}
