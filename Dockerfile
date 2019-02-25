FROM damacus/docker-builder:latest

ENV TERRAFORM_VERSION=0.11.11
ENV TERRAFORM_SHA256SUM=94504f4a67bad612b5c8e3a4b7ce6ca2772b3c1559630dfd71e9c519e3d6149c

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS \
  && sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin \
  && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ARG PROJECT="terraform-builder"
ARG DESCRIPTION="Docker container with Docker, Inspec, Ruby & Terraform"
ARG URL="https://github.com/damacus/docker-terraform-builder"
ARG CIRCLE_SHA1=unknown

LABEL "io.damacus.title"=$PROJECT \
  "io.damacus.description"=$DESCRIPTION \
  "io.damacus.url"=$URL \
  "io.damacus.revision"=$CIRCLE_SHA1 \
  "terraform.version"=$TERRAFORM_VERSION \
  "terraform.sha256sum"=$TERRAFORM_SHA256SUM
