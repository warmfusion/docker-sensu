build:
	docker build -t warmfusion/sensu-server .

tag: build
	docker tag warmfusion/sensu warmfusion/sensu-server:0.20.3-1
	docker tag warmfusion/sensu warmfusion/sensu-server:latest

push: tag
	docker push warmfusion/sensu-server:0.20.3-1
	docker push warmfusion/sensu-server:latest
