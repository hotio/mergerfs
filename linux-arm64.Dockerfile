ARG UPSTREAM_IMAGE
ARG UPSTREAM_DIGEST_ARM64

FROM ${UPSTREAM_IMAGE}@${UPSTREAM_DIGEST_ARM64}

ENTRYPOINT ["mergerfs", "-f"]

RUN apk add --no-cache fuse

ARG VERSION
ADD "https://github.com/trapexit/mergerfs/releases/download/${VERSION}/mergerfs-${VERSION}-static-linux_arm64.tar.gz" "/tmp"
RUN tar xzf "/tmp/mergerfs-static-linux_arm64.tar.gz" -C "/" && \
    rm -rf "/tmp/mergerfs-static-linux_arm64.tar.gz"
