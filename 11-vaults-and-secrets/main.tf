data "vault_kv_secret_v2" "application" {
  mount = "kv"
  name = "application"
}
