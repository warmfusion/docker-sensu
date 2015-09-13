
build:
	make -C sensu
	make -C sensu-client
	make -C sensu-server
	make -C sensu-api

push:
	docker push warmfusion/sensu
	docker push warmfusion/sensu-client
	docker push warmfusion/sensu-server
	docker push warmfusion/sensu-api