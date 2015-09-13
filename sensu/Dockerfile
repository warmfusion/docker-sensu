FROM debian:latest

MAINTAINER Toby Jackson <toby@warmfusion.co.uk>

ADD http://repos.sensuapp.org/apt/pubkey.gpg /tmp/pubkey.gpg


RUN \
  apt-key add /tmp/pubkey.gpg \
  && echo 'deb http://repos.sensuapp.org/apt sensu main' > /etc/apt/sources.list.d/sensu.list \
  && apt-get update \
  && apt-get install -y sensu \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install a handy little json editor which i _think_ it'd be possible
# to configure the endpoints using things like (but no-inline option alas)
#
#     jq '.client.name="'$(hostname)'"' config.json.example
#
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /bin/jq
RUN chmod 755 /bin/jq

VOLUME /etc/sensu

ENV SENSU_LOG_LEVEL=INFO
ENV SENSU_OPTIONS=
