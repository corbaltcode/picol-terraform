resource "aws_subnet" "private" {
  count = length(data.aws_availability_zones.available.names)

  assign_ipv6_address_on_creation = true
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, count.index)
  enable_resource_name_dns_aaaa_record_on_launch = true
  enable_resource_name_dns_a_record_on_launch = true
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, count.index)
  private_dns_hostname_type_on_launch = "ip-name"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project} ${var.environment} private subnet ${data.aws_availability_zones.available.names[count.index]}"
    Connectivity = "private"
  }
}

resource "aws_subnet" "public" {
  count = length(data.aws_availability_zones.available.names)

  assign_ipv6_address_on_creation = true
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 8 + count.index)
  enable_resource_name_dns_aaaa_record_on_launch = true
  enable_resource_name_dns_a_record_on_launch = true
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 128 + count.index)
  private_dns_hostname_type_on_launch = "ip-name"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project} ${var.environment} public subnet ${data.aws_availability_zones.available.names[count.index]}"
    Connectivity = "public"
  }
}
