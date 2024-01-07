FROM hashicorp/terraform:1.6

RUN apk add openrc docker=24.0.7-r0
RUN rc-update add docker default

ARG DEPLOY_ENV

# Conditionally install Kind for local deployment
RUN if [ "$DEPLOY_ENV" = "local" ]; then \
        apk add --no-cache curl && \
        curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64 && \
        chmod +x ./kind && \
        mv ./kind /usr/local/bin/kind && \
        curl -LO https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl && \
        chmod +x ./kubectl && \
        mv ./kubectl /usr/local/bin/kubectl; \
    fi


WORKDIR /deploy

ENTRYPOINT [ "sh" ]
# ENTRYPOINT ["terraform", "-chdir=/deploy/terraform"]