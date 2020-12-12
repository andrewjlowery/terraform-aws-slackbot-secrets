output "secret_version" {
  description = "Slackbot SecretsManager secret version"
  sensitive   = true
  value       = aws_secretsmanager_secret_version.secret_version
}
