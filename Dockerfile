FROM damacus/docker-builder:latest

ENV TERRAFORM_VERSION=0.11.8
ENV TERRAFORM_SHA256SUM=84ccfb8e13b5fce63051294f787885b76a1fedef6bdbecf51c5e586c9e20c9b7

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&\
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS &&\
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS &&\
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin &&\
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ARG PROJECT="terraform-builder"
ARG DESCRIPTION="Docker container with Docker, Inspec, Ruby & Terraform"
ARG URL="https://github.com/damacus/docker-builder"
ARG CIRCLE_SHA1=unknown

LABEL "io.damacus.title"=$PROJECT                \
      "io.damacus.description"=$DESCRIPTION      \
      "io.damacus.url"=$URL                      \
      "io.damacus.revision"=$CIRCLE_SHA1         \
      "terraform.version"=$TERRAFORM_VERSION     \
      "terraform.sha256sum"=$TERRAFORM_SHA256SUM
