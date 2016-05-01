FROM ubuntu:16.04

MAINTAINER chris@olstrom.com

# Interactive prompts don't play nice with automated build systems. Better to
# fail and log the required configuration, so it can be added to the Dockerfile.
ENV DEBIAN_FRONTEND noninteractive

# A freshly upgraded system gives us a clean foundation to build on. Standard
# cleanup is included to reduce image bloat.
RUN apt-get update \
    && apt-get --assume-yes dist-upgrade \
    && apt-get --assume-yes install apt-transport-https software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
