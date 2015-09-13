build:
	docker build -t warmfusion/sensu .

tag: build
	docker tag warmfusion/sensu warmfusion/sensu:0.20.3-1
	docker tag warmfusion/sensu warmfusion/sensu:latest

push: tag
	docker push warmfusion/sensu:0.20.3-1
	docker push warmfusion/sensu:latest
