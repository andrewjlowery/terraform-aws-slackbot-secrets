output "kms_key_alias" {
  description = "KMS key alias"
  value       = aws_kms_alias.key_alias
}

output "kms_key" {
  description = "KMS key"
  value       = aws_kms_key.key
}

output "secret" {
  description = "Slackbot SecretsManager secret"
  value       = aws_secretsmanager_secret.slack_secret
}

output "secret_version" {
  description = "Slackbot SecretsManager secret version"
  sensitive   = true
  value       = aws_secretsmanager_secret_version.slack_secret_version
}
