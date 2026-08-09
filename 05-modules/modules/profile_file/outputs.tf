output "filename" {
  description = "path of the generated profile file"
  value       = local_file.profile.filename
}

output "name" {
  description = "The name used in the filename"
  value       = var.name
}