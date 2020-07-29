# Slackbot Secrets

[![terraform](https://img.shields.io/github/v/tag/amancevice/terraform-aws-slackbot-secrets?color=62f&label=version&logo=terraform&style=flat-square)](https://registry.terraform.io/modules/amancevice/serverless-pypi/aws)
[![build](https://img.shields.io/github/workflow/status/amancevice/terraform-aws-slackbot-secrets/validate?logo=github&style=flat-square)](https://github.com/amancevice/terraform-aws-slackbot-secrets/actions)

Add-on for [amancevice/slackbot/aws](https://github.com/amancevice/terraform-aws-slackbot) terraform module to add required SecreteManager secret to support the slackbot module.

_NOTE—deployed instances of this module will contain sensitive information in their state files._
_You should NEVER store your secrets in plaintext or deploy with a remote state that is unencrypted!_

## Usage

```terraform
module slackbot {
  source  = "amancevice/slackbot/aws"
  version = "~> 18.2"
  # …
}

module slackbot_secret {
  source  = "amancevice/slackbot-secrets/aws"
  version = "~> 5.0"

  # Required…

  # Name your AWS resources
  kms_key_alias = "alias/slack/my-kms-key-alias"
  secret_name   = "slack/my-secret-name"

  # Provided by Slack
  slack_client_id      = "<slack-oauth2-client-id>"
  slack_client_secret  = "<slack-oauth2-client-secret>"
  slack_signing_secret = "<slack-signing-secret>"
  slack_token          = "<slack-token>"

  # Optional

  kms_key_deletion_window_in_days = 30
  kms_key_enable_key_rotation     = false
  kms_key_is_enabled              = true
  kms_key_description             = "My KMS Key"
  kms_key_policy_document         = "{ … }"
  kms_key_usage                   = "ENCRYPT_DECRYPT"
  secret_description              = "My Secret"
  secret_recovery_window_in_days  = 30

  slack_oauth_error_uri    = "http://example.com/"
  slack_oauth_redirect_uri = "http://example.com/"
  slack_oauth_success_uri  = "slack://open"
  slack_signing_version    = "v0"

  kms_key_tags = {
    # …
  }

  secret_tags = {
    # …
  }

  secrets = {
    # Additional secrets to store…
  }
}
```
