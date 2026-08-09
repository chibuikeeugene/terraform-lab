resource "local_file" "profile" {
  filename = "${var.output_directory}/${lower(var.name)}-profile.txt"
  content  = <<-EOT
  Name: ${title(var.name)}
  Role: ${var.role}
  Skills: ${length(var.skills) > 0 ? join(",", var.skills) : "None"}
  EOT
}