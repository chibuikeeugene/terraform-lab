output "filename" {
  description = "path of the generated profile file"
  value       = local_file.profile.filename
}

output "name" {
  description = "The name used in the filename"
  value       = var.name
}

output "profile_summary" {
  description = "The summary of the generated profile"
  value       = "${title(var.name)}-${var.role}-${var.environment}"
}