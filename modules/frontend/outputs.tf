output "ecr_url" {
  value       = aws_ecr_repository.frontend.repository_url
  description = "ECR URL for the frontend container image"
}

output "lambda_url" {
  value       = data.aws_ssm_parameter.frontend_sha256.insecure_value == "<none>" ? null : aws_lambda_function_url.frontend[0].function_url
  description = "URL for the frontend Lambda function"
}
