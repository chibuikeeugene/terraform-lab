resource "aws_security_group" "this" {
  # creating individual security group resouces using for_each
  for_each = var.security_groups

  name        = "${var.environment}-${each.key}-sg"
  description = each.value.description
  vpc_id      = var.vpc_id
  tags = merge(
    var.common_tags,
    {
      Name        = "${var.environment}-${each.key}-sg"
      Environment = var.environment
      Tier        = each.key
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "cidr" {
  for_each = local.flattened_cidr_ingress_rule_map

  security_group_id = aws_security_group.this[
    each.value.security_group
  ].id

  description = each.value.description

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.protocol

  cidr_ipv4 = each.value.cidr
}

resource "aws_vpc_security_group_ingress_rule" "security_group" {
  for_each = local.sg_ingress_rule_map

  security_group_id            = aws_security_group.this[each.value.target_security_group].id
  referenced_security_group_id = aws_security_group.this[each.value.source_security_group].id

  description = each.value.description
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.protocol
}