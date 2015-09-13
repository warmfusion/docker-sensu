FROM debian:latest

MAINTAINER Toby Jackson <toby@warmfusion.co.uk>

ADD http://repos.sensuapp.org/apt/pubkey.gpg /tmp/pubkey.gpg


RUN \
  apt-key add /tmp/pubkey.gpg \
  && echo 'deb http://repos.sensuapp.org/apt sensu main' > /etc/apt/sources.list.d/sensu.list \
  && apt-get update \
  && apt-get install -y sensu=0.20.3-1 \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY bootstrap-sensu-config.rb /bootstrap-sensu-config.rb
COPY bootstrap-sensu.sh /bootstrap-sensu.sh

# Give a starting client.json so we can be sure
# the sensu-systems have a fighting chance of starting
# with no additional work from the user.
COPY conf.d/client.json /etc/sensu/conf.d/client.json

# Make the config directory a volume so people can
# create their own configs and load them into the container
VOLUME /etc/sensu/conf.d

# Some default options
ENV SENSU_LOG_LEVEL=INFO
ENV SENSU_OPTIONS=

# 
ENV SENSU_TRANSPORT=rabbitmq://sensu:sensu@rabbitmq:5672/?vhost=/sensu
ENV SENSU_REDIS=redis://redis:6379
ENV SENSU_API=api://sensuapi:4567

# Run the configuration converter and then whatever the user has given as an argument
# to the docker run - useful for debugging (eg docker run $self bash)
CMD /bootstrap-sensu-config.rb