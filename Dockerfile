FROM damacus/docker-builder:latest

ENV TERRAFORM_VERSION=0.11.8
ENV TERRAFORM_SHA256SUM=84ccfb8e13b5fce63051294f787885b76a1fedef6bdbecf51c5e586c9e20c9b7

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&\
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS &&\
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS &&\
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin &&\
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ARG PROJECT=unknown
ARG DATE=unknown
ARG DESCRIPTION=unknown
ARG URL=unknown
ARG COMMIT=unknown

LABEL "io.damacus.title"=$PROJECT                \
      "io.damacus.created"=$DATE                 \
      "io.damacus.description"=$DESCRIPTION      \
      "io.damacus.url"=$URL                      \
      "io.damacus.revision"=$COMMIT              \
      "terraform.version"=$TERRAFORM_VERSION     \
      "terraform.sha256sum"=$TERRAFORM_SHA256SUM
