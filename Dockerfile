# syntax=docker/dockerfile:1

FROM scratch

LABEL maintainer="SimCity"

# copy local files
COPY root/ /
