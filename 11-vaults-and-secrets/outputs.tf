output "application_username" {
  value = data.vault_kv_secret_v2.application.data["username"]
  sensitive = true
}

output "application_password" {
  value = data.vault_kv_secret_v2.application.data["password"]
  sensitive = true
}