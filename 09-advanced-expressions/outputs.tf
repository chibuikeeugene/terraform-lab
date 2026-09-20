output "security_group_ids" {
  value = {
    for name, sg in aws_security_group.this :
    name => sg.id
  }
}

output "cidr_ingress_rules" {
  value = local.flattened_cidr_ingress_rule_map
}

output "security_group_ingress_rules" {
  value = local.sg_ingress_rule_map
}