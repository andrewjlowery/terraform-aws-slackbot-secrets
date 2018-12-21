output kms_key_alias {
  description = "KMS key alias."
  value       = "${aws_kms_alias.key_alias.name}"
}

output kms_key_arn {
  description = "KMS key ARN."
  value       = "${aws_kms_key.key.arn}"
}

output kms_key_id {
  description = "KMS key ID."
  value       = "${aws_kms_key.key.key_id}"
}

output secret_arn {
  description = "Slackbot SecretsManager secret ARN."
  value       = "${aws_secretsmanager_secret.slack_secret.arn}"
}

output secret_name {
  description = "Slackbot SecretsManager secret name."
  value       = "${aws_secretsmanager_secret.slack_secret.name}"
}
