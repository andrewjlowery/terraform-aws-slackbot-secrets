terraform {
  required_version = "~> 0.12"

  required_providers {
    aws = "~> 2.11"
  }
}

locals {
  secrets = {
    SLACK_CLIENT_ID          = var.slack_client_id
    SLACK_CLIENT_SECRET      = var.slack_client_secret
    SLACK_OAUTH_ERROR_URI    = var.slack_oauth_error_uri
    SLACK_OAUTH_REDIRECT_URI = var.slack_oauth_redirect_uri
    SLACK_OAUTH_SUCCESS_URI  = var.slack_oauth_success_uri
    SLACK_SIGNING_SECRET     = var.slack_signing_secret
    SLACK_SIGNING_VERSION    = var.slack_signing_version
    SLACK_TOKEN              = var.slack_token
  }
}

resource aws_kms_key key {
  deletion_window_in_days = var.kms_key_deletion_window_in_days
  description             = var.kms_key_description
  enable_key_rotation     = var.kms_key_enable_key_rotation
  is_enabled              = var.kms_key_is_enabled
  key_usage               = var.kms_key_usage
  policy                  = var.kms_key_policy
  tags                    = var.kms_key_tags
}

resource aws_kms_alias key_alias {
  name          = var.kms_key_alias
  target_key_id = aws_kms_key.key.key_id
}

resource aws_secretsmanager_secret slack_secret {
  description             = var.secret_description
  kms_key_id              = aws_kms_key.key.key_id
  name                    = var.secret_name
  recovery_window_in_days = var.secret_recovery_window_in_days
  rotation_lambda_arn     = var.secret_rotation_lambda_arn
  tags                    = var.secret_tags
}

resource aws_secretsmanager_secret_version slack_secret_version {
  secret_id     = aws_secretsmanager_secret.slack_secret.id
  secret_string = jsonencode(merge(var.secrets, local.secrets))
}
