output "application_file" {
  description = "Generated application file"
  value       = local_file.application.filename
}

output "policy_content" {
  description = "Content read from the data source"
  value       = data.local_file.source_policy.content
}

output "report_file" {
  description = "Generated report file"
  value       = local_file.report.filename
}

output "release_marker_id" {
  description = "the ID of the current release marker"
  value       = terraform_data.release_marker.id
}