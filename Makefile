.PHONY: validate

validate: | .terraform
	terraform fmt -check
	AWS_REGION=us-east-1 terraform validate

.terraform:
	terraform init
