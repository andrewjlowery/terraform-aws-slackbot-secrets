ARG TERRAFORM=latest
FROM hashicorp/terraform:${TERRAFORM}
COPY . .
RUN terraform fmt -check
ARG AWS_DEFAULT_REGION=us-east-1
RUN terraform init
RUN terraform validate
