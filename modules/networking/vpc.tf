resource "aws_vpc" "main" {
  cidr_block = var.vpc_ipv4_cidr
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "${var.project} ${var.environment} VPC"
  }
}