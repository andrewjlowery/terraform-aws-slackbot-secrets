.terraform:
	terraform init

.PHONY: validate

validate: | .terraform
	terraform fmt -check
	terraform validate
