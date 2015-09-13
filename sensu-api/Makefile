build:
	docker build -t warmfusion/sensu-api .

tag: build
	docker tag warmfusion/sensu warmfusion/sensu-api:0.20.3-1
	docker tag warmfusion/sensu warmfusion/sensu-api:latest

push: tag
	docker push warmfusion/sensu-api:0.20.3-1
	docker push warmfusion/sensu-api:latest
