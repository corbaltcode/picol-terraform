resource "aws_s3_bucket" "flow_logs" {
  bucket = "${lower(var.project)}-${var.environment}-flow-logs"
  tags = {
    Name = "${var.project} ${var.environment} VPC flow logs"
  }
}

resource "aws_s3_bucket_policy" "flow_logs" {
  bucket = aws_s3_bucket.flow_logs.id
  policy = jsonencode(
    {
      "Version" = "2012-10-17",
      "Statement" = [
        {
          "Sid" = "RequireSSL",
          "Effect" = "Deny",
          "Action" = "s3:*",
          "Resource" = [
            "arn:${var.partition}:s3:::${aws_s3_bucket.flow_logs.id}",
            "arn:${var.partition}:s3:::${aws_s3_bucket.flow_logs.id}/*",
          ],
          "Principal" = "*",
          "Condition" = {
            "Bool" = {
              "aws:SecureTransport" = "false",
            },
          },
        },
        {
          "Sid" = "AWSLogDeliveryWrite",
          "Effect" = "Allow",
          "Principal" = {
            "Service" = "delivery.logs.amazonaws.com"
          },
          "Action" = [
            "s3:PutObject"
          ],
          "Resource" = [
            "arn:${var.partition}:s3:::${aws_s3_bucket.flow_logs.id}/FlowLogs/*"
          ],
          "Condition" = {
            "StringEquals" = {
              "aws:SourceAccount" = var.account_id,
              "s3:x-amz-acl" = "bucket-owner-full-control",
            },
            "ArnLike" = {
              "aws:SourceArn" = "arn:${var.partition}:logs:${var.region}:${var.account_id}:*"
            },
          },
        },
        {
          "Sid" = "AWSLogDeliveryAclCheck",
          "Effect" = "Allow",
          "Principal" = {
            "Service" = "delivery.logs.amazonaws.com"
          },
          "Action" = [
            "s3:GetBucketAcl",
            "s3:ListBucket",
          ],
          "Resource" = [
            "arn:${var.partition}:s3:::${aws_s3_bucket.flow_logs.id}"
          ],
          "Condition" = {
            "StringEquals" = {
              "aws:SourceAccount" = var.account_id,
            },
            "ArnLike" = {
              "aws:SourceArn" = "arn:${var.partition}:logs:${var.region}:${var.account_id}:*"
            },
          },
        },
      ]
    }
  )
}

resource "aws_flow_log" "vpc" {
  traffic_type = "ALL"
  log_destination_type = "s3"
  vpc_id = aws_vpc.main.id
  max_aggregation_interval = 600
  log_destination = "arn:${var.partition}:s3:::${aws_s3_bucket.flow_logs.id}/FlowLogs/"
  log_format = "$${version} $${account-id} $${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${protocol} $${packets} $${bytes} $${start} $${end} $${action} $${log-status} $${vpc-id} $${subnet-id} $${instance-id} $${tcp-flags} $${type} $${pkt-srcaddr} $${pkt-dstaddr} $${region} $${az-id} $${pkt-src-aws-service} $${pkt-dst-aws-service} $${flow-direction} $${traffic-path}"
  destination_options {
    file_format = "parquet"
    hive_compatible_partitions = true
    per_hour_partition = true
  }
  tags = {
    Name = "${var.project} ${var.environment} VPC flow logs"
  }
}
