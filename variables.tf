variable kms_key_alias {
  description = "KMS Key alias"
}

variable kms_key_deletion_window_in_days {
  description = "KMS key deletion window"
  default     = 30
}

variable kms_key_enable_key_rotation {
  description = "KMS Key rotation flag"
  default     = false
}

variable kms_key_is_enabled {
  description = "KMS Key enabled flag"
  default     = true
}

variable kms_key_description {
  description = "KMS key description"
  default     = "Slackbot key"
}

variable kms_key_policy {
  description = "KMS key policy JSON document"
  default     = null
}

variable kms_key_tags {
  description = "KMS Key tags"
  type        = map(string)
  default     = {}
}

variable kms_key_usage {
  description = "Usage of Slackbot KMS Key"
  default     = "ENCRYPT_DECRYPT"
}

variable secret_description {
  description = "SecretsManager secret description"
  default     = "Slackbot secrets"
}

variable secret_name {
  description = "SecretsManager secret name"
}

variable secret_recovery_window_in_days {
  description = "SecretsManager secret recovery window"
  default     = 30
}

variable secret_rotation_lambda_arn {
  description = "SecretsManager secret Lambda rotation ARN"
  default     = ""
}

variable secret_tags {
  description = "SecretsManager secret tags"
  type        = map(string)
  default     = {}
}

variable secrets {
  description = "Additional SecretsManager secrets"
  type        = map(string)
  default     = {}
}

variable slack_client_id {
  description = "Slack client ID"
}

variable slack_client_secret {
  description = "Slack client secret"
}

variable slack_oauth_error_uri {
  description = "Slack OAuth error URI"
  default     = null
}

variable slack_oauth_redirect_uri {
  description = "Slack OAuth redirect URI"
  default     = null
}

variable slack_oauth_success_uri {
  description = "Slack OAuth redirect URI"
  default     = "slack://open"
}

variable slack_signing_secret {
  description = "Slack signing secret"
}

variable slack_signing_version {
  description = "Slack signing version"
  default     = "v0"
}

variable slack_token {
  description = "Slack bot OAuth token"
}
