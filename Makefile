
build:
	make -C sensu
	make -C sensu-client
	make -C sensu-server

push:
	docker push warmfusion/sensu
	docker push warmfusion/sensu-client
	docker push warmfusion/sensu-server