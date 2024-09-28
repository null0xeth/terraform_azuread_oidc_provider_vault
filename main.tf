resource "vault_policy" "admin" {
  count  = length(var.vault_policy_names)
  name   = element(var.vault_policy_names, count.index) #element(var.vault_policy_names, 0)
  policy = file("${path.module}/assets/${element(var.vault_policy_names, count.index)}_policy.hcl")
}

resource "vault_jwt_auth_backend" "azure_oidc" {
  description        = "OIDC backend"
  oidc_discovery_url = "https://login.microsoftonline.com/${var.azure_ad_config.tenant_id}/v2.0" #"https://login.microsoftonline.com/${var.azure_ad_config.tenant_id}/v2.0"
  path               = var.vault_oidc_config.backend.path
  type               = var.vault_oidc_config.backend.type
  oidc_client_id     = var.azure_ad_config.client_id
  oidc_client_secret = var.azure_ad_config.client_secret
  default_role       = var.azure_ad_config.role
}

resource "vault_jwt_auth_backend_role" "azure_role" {
  role_name             = var.azure_ad_config.role
  backend               = vault_jwt_auth_backend.azure_oidc.path
  user_claim            = var.vault_oidc_config.user_claim
  groups_claim          = var.vault_oidc_config.groups_claim
  role_type             = var.vault_oidc_config.role_type
  oidc_scopes           = var.vault_oidc_config.scopes
  allowed_redirect_uris = var.oidc_redirect_uris
  token_policies        = var.vault_policy_names
}

