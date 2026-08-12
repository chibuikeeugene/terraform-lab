module "user_profile" {
  source = "./modules/profile_file"

  for_each = {
    for username, details in var.users :
    username => details if details.active
  }

  name             = each.key
  role             = each.value.role
  skills           = each.value.skills
  environment      = each.value.environment
  output_directory = path.module
}
