ARG TERRAFORM=latest

FROM hashicorp/terraform:${TERRAFORM}
COPY . .
ARG AWS_DEFAULT_REGION=us-east-1
RUN terraform init
RUN terraform fmt -check
RUN terraform validate
