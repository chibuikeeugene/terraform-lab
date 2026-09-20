locals {
  security_group_descriptions = {
    for name, config in var.security_groups :
    name => config.description
  }
}

# filtering with for
locals {
  groups_with_ingress = {
    for name, config in var.security_groups :
    name => config
    if length(config.ingress_rules) > 0
  }
}

# nesting for operation that produced a list of lists of object
locals {
  nested_ingress_rules = [
    for sg_name, sg in var.security_groups : [
      for rule in sg.ingress_rules : {
        security_group = sg_name
        description    = rule.description
        from_port      = rule.from_port
        to_port        = rule.to_port
        protocol       = rule.protocol
        cidr_blocks    = rule.cidr_block
        source_sg      = rule.source_security_group
      }
    ]
  ]
}

# flattening operation
locals {
  flattened_ingress_rules = flatten([
    for sg_name, sg in var.security_groups : [
      for rule in sg.ingress_rules : {
        security_group = sg_name
        description    = rule.description
        from_port      = rule.from_port
        to_port        = rule.to_port
        protocol       = rule.protocol
        cidr_blocks    = rule.cidr_block
        source_sg      = rule.source_security_group
      }
    ]
  ])
}

# since for_each works well with stable keys
# we convert the flattened keys into a map
locals {
  flattened_ingress_rules_map = {
    for rule in local.flattened_ingress_rules :
    "${rule.security_group}-${rule.from_port}-${rule.to_port}-${coalesce(rule.source_sg, "cidr")}" => rule
  }
}

# in a case where we have a list of cidr blocks, to
# deploy one cidr block per resource we can use this
# also do flatten the resulting output
locals {
  flattened_cidr_ingress_rules = flatten([
    for sg_name, sg in var.security_groups : [
      for rule_index, rule in sg.ingress_rules : [
        for cidr in rule.cidr_block : {
          key            = "${sg_name}-${rule_index}-${replace(cidr, "/", "-")}"
          security_group = sg_name
          description    = coalesce(rule.description, "Managed by Terraform")
          from_port      = rule.from_port
          to_port        = rule.to_port
          protocol       = rule.protocol
          cidr           = cidr
        }
      ]
    ]
  ])

}

# we convert the flattened cidr ingress rules to a map for use by for_each
locals {
  flattened_cidr_ingress_rule_map = {
    for rule in local.flattened_cidr_ingress_rules :
    rule.key => rule
  }
}

#security group-to-security group rules
locals {
  sg_ingress_rules = flatten([
    for sg_name, sg in var.security_groups :
    [
      for rule_index, rule in sg.ingress_rules : {
        key = "${sg_name}-${rule_index}"

        target_security_group = sg_name
        source_security_group = rule.source_security_group

        description = coalesce(
          rule.description,
          "Managed by Terraform"
        )

        from_port = rule.from_port
        to_port   = rule.to_port
        protocol  = rule.protocol
      }
      if rule.source_security_group != null
    ]
  ])
}

locals {
  sg_ingress_rule_map = {
    for rule in local.sg_ingress_rules :
    rule.key => rule
  }
}

# setproduct() operation
locals {
  environments              = toset(["dev", "prod", "staging"])
  services                  = toset(["web", "app"])
  environment_service_pairs = setproduct(local.environments, local.services)
}

# convert to a resource map
locals {
  service_map = {
    for pair in local.environment_service_pairs :
    "${pair[0]}-${pair[1]}" => {
      environment = pair[0]
      service     = pair[1]
    }
  }
}