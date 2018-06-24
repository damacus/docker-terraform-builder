FROM damacus/docker-builder:latest

ENV TERRAFORM_VERSION=0.11.7
ENV TERRAFORM_SHA256SUM=6b8ce67647a59b2a3f70199c304abca0ddec0e49fd060944c26f666298e23418

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip


ARG PROJECT=unknown
ARG DATE=unknown
ARG DESCRIPTION=unknown
ARG URL=unknown
ARG COMMIT=unknown

LABEL "io.damacus.title"=$PROJECT            \
      "io.damacus.created"=$DATE             \
      "io.damacus.description"=$DESCRIPTION  \
      "io.damacus.url"=$URL                  \
      "io.damacus.revision"=$COMMIT
