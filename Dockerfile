ARG RUNTIME=nodejs10.x

FROM lambci/lambda:build-${RUNTIME}
COPY --from=hashicorp/terraform:0.12.2 /bin/terraform /bin/
COPY . .
ARG AWS_DEFAULT_REGION=us-east-1
RUN terraform init
RUN terraform fmt -check
RUN terraform validate
