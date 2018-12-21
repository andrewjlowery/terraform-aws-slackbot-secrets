# Slackbot Secrets

A plugin to create a managed secret in AWS SecretsManager for the [slackbot](https://github.com/amancevice/terraform-aws-slackbot) module.

## Usage

```hcl
module slackbot_secret {
  source                  = "amancevice/slackbot-secrets/aws"
  kms_key_alias           = "alias/slack/your-kms-key-alias"
  secret_name             = "slack/your-secret-name"
  slack_bot_access_token  = "${var.slack_bot_access_token}"
  slack_client_id         = "${var.slack_client_id}"
  slack_client_secret     = "${var.slack_client_secret}"
  slack_signing_secret    = "${var.slack_signing_secret}"
  slack_user_access_token = "${var.slack_user_access_token}"
}

module slackbot {
  source          = "amancevice/slackbot/aws"
  api_description = "My Slack app API"
  api_name        = "<my-api>"
  api_stage_name  = "<my-api-stage>"
  secret_arn      = "${module.slackbot_secret.secret_arn}"
  kms_key_id      = "${module.slackbot_secret.kms_key_id}"
}
```
