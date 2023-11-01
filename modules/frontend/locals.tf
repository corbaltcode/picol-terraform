locals {
  frontend_lambda_function_name = "${lower(var.project)}-${lower(var.environment)}-frontend"
  frontend_iam_role_name        = "${lower(var.project)}-${lower(var.environment)}-lambda-frontend"
  frontend_iam_policy_name      = local.frontend_iam_role_name
  frontend_log_group_name       = "/aws/lambda/${local.frontend_lambda_function_name}"
}
