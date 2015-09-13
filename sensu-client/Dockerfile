FROM warmfusion/sensu

MAINTAINER Toby Jackson <toby@warmfusion.co.uk>

ENTRYPOINT /bootstrap-sensu.sh  /opt/sensu/bin/sensu-client -d /etc/sensu/conf.d -e /etc/sensu/extensions/ -L $SENSU_LOG_LEVEL $SENSU_OPTIONS
