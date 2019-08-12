#!/bin/sh

VERSION=$(grep -e "ARG STELLARIUM_VERSION=" stable/Dockerfile)
VERSION=${VERSION#ARG STELLARIUM_VERSION=\"}
VERSION=${VERSION%\"}
echo "Tagging version ${VERSION}"
docker tag "${DOCKER_USERNAME}/stellarium:latest" "${DOCKER_USERNAME}/stellarium:${VERSION}"
