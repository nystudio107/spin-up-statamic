#!/bin/sh
# Build this image, and push it to DockerHub.com

docker buildx build \
--push \
--no-cache \
--platform linux/arm64/v8,linux/amd64 \
--tag nystudio107/spin-up-statamic-base:8.0-alpine .
