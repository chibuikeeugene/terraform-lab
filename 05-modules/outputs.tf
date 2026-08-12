output "profile_files" {
  description = "Generated profile files by username"
  value = {
    for username, details in module.user_profile :
    username => details.filename
  }
}

output "names" {
  description = "Names of the individuals with profiles"
  value = {
    for username, details in module.user_profile :
    username => details.name
  }
}

output "profile_summaries" {
  description = "Summary returned by each module instance"
  value = {
    for username, details in module.user_profile :
    username => details.profile_summary
  }
}