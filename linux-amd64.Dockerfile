ARG UPSTREAM_IMAGE
ARG UPSTREAM_DIGEST_AMD64

FROM ${UPSTREAM_IMAGE}@${UPSTREAM_DIGEST_AMD64}

ENTRYPOINT ["mergerfs", "-f"]

RUN apk add --no-cache fuse

ARG VERSION
RUN curl -fsSL "https://github.com/trapexit/mergerfs/releases/download/${VERSION}/mergerfs-static-linux_amd64.tar.gz" | tar xzf - -C "/"
