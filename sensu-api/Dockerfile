FROM warmfusion/sensu:latest

MAINTAINER Toby Jackson <toby@warmfusion.co.uk>

ENTRYPOINT /bootstrap-sensu.sh /opt/sensu/bin/sensu-api -d /etc/sensu/conf.d -e /etc/sensu/extensions/ -L $SENSU_LOG_LEVEL $SENSU_OPTIONS
