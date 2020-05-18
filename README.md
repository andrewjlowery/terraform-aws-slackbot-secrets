# Slackbot Secrets

[![terraform](https://img.shields.io/github/v/tag/amancevice/terraform-aws-slackbot-secrets?color=62f&label=version&logo=terraform&style=flat-square)](https://registry.terraform.io/modules/amancevice/serverless-pypi/aws)
[![build](https://img.shields.io/github/workflow/status/amancevice/terraform-aws-slackbot-secrets/Test?logo=github&style=flat-square)](https://github.com/amancevice/terraform-aws-slackbot-secrets/actions)

A plugin to create a managed secret in AWS SecretsManager for the [slackbot](https://github.com/amancevice/terraform-aws-slackbot) module.

## Usage

```hcl
module slackbot_secret {
  source                   = "amancevice/slackbot-secrets/aws"
  version                  = "~> 3.0"
  kms_key_alias            = "alias/slack/your-kms-key-alias"
  secret_name              = "slack/your-secret-name"
  slack_token              = var.slack_bot_access_token
  slack_client_id          = var.slack_client_id
  slack_client_secret      = var.slack_client_secret
  slack_oauth_redirect_uri = var.slack_oauth_redirect_uri
  slack_signing_secret     = var.slack_signing_secret
  slack_signing_version    = var.slack_signing_version

  // Additional secrets
  secrets = {
    FIZZ = "buzz"
  }
}

module slackbot {
  source          = "amancevice/slackbot/aws"
  version         = "~> 18.1"
  api_description = "My Slack app API"
  api_name        = "<my-api>"
  api_stage_name  = "<my-api-stage>"
  secret_arn      = module.slackbot_secret.secret_arn
  kms_key_id      = module.slackbot_secret.kms_key_id
}
```
