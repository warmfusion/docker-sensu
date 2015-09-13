
build:
	make -C sensu
	make -C sensu-Client
	make -C sensu-server
	make -C sensu-api

push:
	make -C sensu push 
	make -C sensu-Client push
	make -C sensu-server push
	make -C sensu-api push