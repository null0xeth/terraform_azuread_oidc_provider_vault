# variable "okcurrent_tenant_id" {
#   type        = string
#   default     = null
#   description = "SYSTEM GENERATED: the current AzureAD tenant ID"
# }

variable "azure_ad_config" {
  default = {}
  type = object({
    tenant_id     = optional(string)
    client_id     = optional(string)
    client_secret = optional(string)
    role          = optional(string, "admin")
  })
}

variable "vault_policy_names" {
  type    = list(string)
  default = ["admin"]
}

variable "oidc_redirect_uris" {
  default = []
  type    = list(string)
}

variable "vault_oidc_config" {
  default = {}
  type = object({
    backend = optional(object({
      type = optional(string, "oidc")
      path = optional(string, "oidc")
    }), {})
    role_type           = optional(string, "oidc")
    user_claim          = optional(string, "sub")
    groups_claim        = optional(string, "groups")
    scopes              = optional(list(string), ["https://graph.microsoft.com/.default"])
    additional_policies = optional(list(string), [])
    cli_redirect_uri    = optional(string, "http://localhost:8250/oidc/callback")
  })
}
