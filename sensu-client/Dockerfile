FROM warmfusion/sensu:latest

MAINTAINER Toby Jackson <toby@warmfusion.co.uk>
sensu-api/Dockerfile
ENTRYPOINT /bootstrap-sensu.sh  /opt/sensu/bin/sensu-client -d /etc/sensu/conf.d -e /etc/sensu/extensions/ -L $SENSU_LOG_LEVEL $SENSU_OPTIONS
