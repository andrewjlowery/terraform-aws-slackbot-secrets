terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id = var.secret.id

  secret_string = jsonencode(merge({
    SLACK_CLIENT_ID          = var.slack_client_id
    SLACK_CLIENT_SECRET      = var.slack_client_secret
    SLACK_OAUTH_ERROR_URI    = var.slack_oauth_error_uri
    SLACK_OAUTH_REDIRECT_URI = var.slack_oauth_redirect_uri
    SLACK_OAUTH_SUCCESS_URI  = var.slack_oauth_success_uri
    SLACK_SIGNING_SECRET     = var.slack_signing_secret
    SLACK_SIGNING_VERSION    = var.slack_signing_version
    SLACK_TOKEN              = var.slack_token
  }, var.additional_secrets))
  lifecycle {
    ignore_changes = [
      secret_string
    ]
  }
}
