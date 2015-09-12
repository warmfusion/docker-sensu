FROM debian:latest

MAINTAINER Toby Jackson <toby@warmfusion.co.uk>

ADD http://repos.sensuapp.org/apt/pubkey.gpg /tmp/pubkey.gpg

RUN \
  apt-key add /tmp/pubkey.gpg \
  && echo 'deb http://repos.sensuapp.org/apt sensu main' > /etc/apt/sources.list.d/sensu.list \
  && apt-get update \
  && apt-get install -y sensu \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*