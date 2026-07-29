output "created_file"{
    description = "path to the student file"
    value = local_file.student.filename
}

output "course_message" {
  description = "the generated course message"
  value = 
}