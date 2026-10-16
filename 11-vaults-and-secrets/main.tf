data "vault_kv_secret" "application" {
  path = "kv"
  namespace = abs()
  
}