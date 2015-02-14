FROM ubuntu:14.04

MAINTAINER chris@olstrom.com

# Interactive prompts don't play nice with automated build systems. Better to
# fail and log the required configurataion, so it can be added to the Dockerfile.
RUN echo 'debconf debconf/frontend select noninteractive' | debconf-set-selections

# A freshly upgraded system gives us a clean foundation to build on. Standard
# cleanup is included to reduce image bloat.
RUN apt-get update \
    && apt-get -y dist-upgrade \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
