FROM warmfusion/sensu

MAINTAINER Toby Jackson <toby@warmfusion.co.uk>

COPY client.json /etc/sensu/
COPY conf.d /etc/sensu/

VOLUME /etc/sensu/conf.d


ENV SENSU_LOG_LEVEL=DEBUG
ENV SENSU_OPTIONS=


ENTRYPOINT /opt/sensu/bin/sensu-server -c /etc/sensu/client.json -d /etc/sensu/conf.d -e /etc/sensu/extensions/ -L $SENSU_LOG_LEVEL $SENSU_OPTIONS