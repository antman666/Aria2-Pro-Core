ARG BUILDER_IMAGE=debian:12

FROM $BUILDER_IMAGE AS builder

WORKDIR /antman666/aria2-builder

COPY . .

ENV DEBIAN_FRONTEND=noninteractive

ARG BUILD_SCRIPT=aria2-gnu-linux-build-amd64.sh

RUN bash $BUILD_SCRIPT

FROM scratch

COPY --from=builder /root/output /
