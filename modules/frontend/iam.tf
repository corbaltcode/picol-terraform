resource "aws_iam_role" "frontend" {
  name        = local.frontend_iam_role_name
  description = "${var.project} ${var.environment} website frontend"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "frontend" {
  name        = local.frontend_iam_policy_name
  description = "${var.project} ${var.environment} website frontend"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ],
        Effect = "Allow",
        Resource = [
          aws_cloudwatch_log_group.frontend.arn,
          "${aws_cloudwatch_log_group.frontend.arn}:log-stream:*",
          aws_ecr_repository.frontend.arn,
        ],
      },
      {
        Action = [
          "logs:DescribeLogGroups",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "frontend" {
  role       = aws_iam_role.frontend.name
  policy_arn = aws_iam_policy.frontend.arn
}
