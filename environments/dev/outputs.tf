output "frontend_ecr_url" {
  value       = module.frontend.ecr_url
  description = "ECR URL for the frontend container image"
}

output "frontend_lambda_url" {
  value       = module.frontend.lambda_url
  description = "URL for the frontend Lambda function"
}
