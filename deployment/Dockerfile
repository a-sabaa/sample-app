FROM hashicorp/terraform:1.6

RUN apk add openrc docker=24.0.7-r0
RUN rc-update add docker default

WORKDIR /deploy

# ENTRYPOINT [ "sh" ]
ENTRYPOINT ["terraform", "-chdir=/deploy/terraform"]