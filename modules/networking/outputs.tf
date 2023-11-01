output "private_subnet_ids" {
  description = "The private subnet IDs for the VPC"
  value = aws_subnet.private.*.id
}