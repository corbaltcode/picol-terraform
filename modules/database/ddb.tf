resource "aws_dynamodb_table" "crops" {
  name         = "${var.table_prefix}${title(var.project)}${title(var.environment)}Crops"
  billing_mode = var.billing_mode
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "ingredients" {
  name         = "${var.table_prefix}${title(var.project)}${title(var.environment)}Ingredients"
  billing_mode = var.billing_mode
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "labels" {
  name         = "${var.table_prefix}${title(var.project)}${title(var.environment)}Labels"
  billing_mode = var.billing_mode
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "pesticide_types" {
  name         = "${var.table_prefix}${title(var.project)}${title(var.environment)}PesticideTypes"
  billing_mode = var.billing_mode
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "pests" {
  name         = "${var.table_prefix}${title(var.project)}${title(var.environment)}Pests"
  billing_mode = var.billing_mode
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "registrants" {
  name         = "${var.table_prefix}${title(var.project)}${title(var.environment)}Registrants"
  billing_mode = var.billing_mode
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "resistances" {
  name         = "${var.table_prefix}${title(var.project)}${title(var.environment)}Resistances"
  billing_mode = var.billing_mode
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "sequences" {
  name         = "${var.table_prefix}${title(var.project)}${title(var.environment)}Sequences"
  billing_mode = var.billing_mode
  hash_key     = "SequenceName"

  attribute {
    name = "SequenceName"
    type = "S"
  }
}
