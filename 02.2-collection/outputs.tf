output "numbered_files" {
  description = "Files created using count"
  value       = local_file.team-members[*].filename
}

output "user_files" {
  description = "Files created using for_each"
  value = {
    for username, file in local_file.users :
    username => file.filename
  }
}

output "active_users" {
  description = "Users whose active value is true"
  value = [
    for username, details in var.users :
    username if details.active
  ]
}