resource "aws_lambda_function" "frontend" {
  function_name = local.frontend_lambda_function_name
  description   = "${var.project} ${var.environment} website frontend"
  role          = aws_iam_role.frontend.arn
  image_uri     = "${aws_ecr_repository.frontend.repository_url}:${data.aws_ssm_parameter.frontend_sha256.insecure_value}"
  architectures = ["arm64"]
  memory_size   = var.frontend_memory_mb
  package_type  = "Image"
  timeout       = var.frontend_timeout_secs

  depends_on = [
    aws_iam_role_policy_attachment.frontend,
  ]
}

resource "aws_lambda_function_url" "frontend" {
  count              = data.aws_ssm_parameter.frontend_sha256.insecure_value == "<none>" ? 0 : 1
  function_name      = local.frontend_lambda_function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_methods     = ["*"]
    allow_origins     = ["*"] // FIXME: Change this!
  }
}

data "aws_ssm_parameter" "frontend_sha256" {
  name = "/${var.project}/${var.environment}/frontend/sha256"
}

resource "aws_cloudwatch_log_group" "frontend" {
  name              = local.frontend_log_group_name
  retention_in_days = var.log_retention_days
}
