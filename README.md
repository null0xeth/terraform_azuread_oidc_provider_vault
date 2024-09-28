<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~>2.53.1 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 4.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_jwt_auth_backend.azure_oidc](https://registry.terraform.io/providers/hashicorp/vault/4.4.0/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.azure_role](https://registry.terraform.io/providers/hashicorp/vault/4.4.0/docs/resources/jwt_auth_backend_role) | resource |
| [vault_policy.admin](https://registry.terraform.io/providers/hashicorp/vault/4.4.0/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_ad_config"></a> [azure\_ad\_config](#input\_azure\_ad\_config) | n/a | <pre>object({<br>    tenant_id     = optional(string)<br>    client_id     = optional(string)<br>    client_secret = optional(string)<br>    role          = optional(string, "admin")<br>  })</pre> | `{}` | no |
| <a name="input_oidc_redirect_uris"></a> [oidc\_redirect\_uris](#input\_oidc\_redirect\_uris) | n/a | `list(string)` | `[]` | no |
| <a name="input_vault_oidc_config"></a> [vault\_oidc\_config](#input\_vault\_oidc\_config) | n/a | <pre>object({<br>    backend = optional(object({<br>      type = optional(string, "oidc")<br>      path = optional(string, "oidc")<br>    }), {})<br>    role_type           = optional(string, "oidc")<br>    user_claim          = optional(string, "sub")<br>    groups_claim        = optional(string, "groups")<br>    scopes              = optional(list(string), ["https://graph.microsoft.com/.default"])<br>    additional_policies = optional(list(string), [])<br>    cli_redirect_uri    = optional(string, "http://localhost:8250/oidc/callback")<br>  })</pre> | `{}` | no |
| <a name="input_vault_policy_names"></a> [vault\_policy\_names](#input\_vault\_policy\_names) | n/a | `list(string)` | <pre>[<br>  "admin"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auth_method"></a> [auth\_method](#output\_auth\_method) | Path that the auth method is mounted at. |
| <a name="output_mount_accessor"></a> [mount\_accessor](#output\_mount\_accessor) | Mount accessor ID for auth method. |
<!-- END_TF_DOCS -->