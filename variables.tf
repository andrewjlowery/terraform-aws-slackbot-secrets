variable "additional_secrets" {
  description = "Additional SecretsManager secrets"
  type        = map(string)
  default     = {}
}

variable "secret" {
  description = "SecretsManager secret"
}

variable "slack_client_id" {
  description = "Slack client ID"
}

variable "slack_client_secret" {
  description = "Slack client secret"
}

variable "slack_oauth_error_uri" {
  description = "Slack OAuth error URI"
  default     = null
}

variable "slack_oauth_redirect_uri" {
  description = "Slack OAuth redirect URI"
  default     = null
}

variable "slack_oauth_success_uri" {
  description = "Slack OAuth redirect URI"
  default     = "slack://open"
}

variable "slack_signing_secret" {
  description = "Slack signing secret"
}

variable "slack_signing_version" {
  description = "Slack signing version"
  default     = "v0"
}

variable "slack_token" {
  description = "Slack bot OAuth token"
}
