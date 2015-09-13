build:
	docker build -t warmfusion/sensu-client .

tag: build
	docker tag warmfusion/sensu warmfusion/sensu-client:0.20.3-1
	docker tag warmfusion/sensu warmfusion/sensu-client:latest

push: tag
	docker push warmfusion/sensu-client:0.20.3-1
	docker push warmfusion/sensu-client:latest
