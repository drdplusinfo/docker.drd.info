FROM ubuntu:focal

ARG USER_ID=1000
ARG GROUP_ID=1000

# Install other missed extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
      mc \
      vim \
      curl \
      apt-transport-https \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'alias ll="ls -al"' >> ~/.bashrc

RUN echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" > /etc/apt/sources.list.d/caddy-fury.list \
		&& apt-get update && apt-get install caddy && caddy list-modules \
		&& touch /var/log/caddy && chown caddy /var/log/caddy

COPY .docker /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
