FROM alpine:3.7 as builder
ARG K8S_VERSION=v1.9.0
RUN apk add -U ca-certificates \
    && rm -rf /var/cache/apk/* \
    && wget -O /kubectl https://storage.googleapis.com/kubernetes-release/release/$K8S_VERSION/bin/linux/amd64/kubectl \
    && chmod +x /kubectl

FROM scratch
COPY --from=builder /kubectl /usr/local/bin/kubectl
ENTRYPOINT ["kubectl"]