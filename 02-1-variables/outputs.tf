output "created_file" {
  description = "path to the student file"
  value       = local_file.student.filename
}

output "course_message" {
  description = "the generated course message"
  value       = local.message
}

output "experience_level" {
  description = "the experience level of the student"
  value       = local.message2
}