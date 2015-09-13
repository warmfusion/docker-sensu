# Sensu Containers

A set of sensu docker containers that can help provision automated checks of docker containers

## Usage

This guide assumes you already have an appropriate Sensu transport server running and redis datastore.

If you're trying this out for the first time, you can start redis and rabbitmq containers with the following
simple commands:

    docker run -d --hostname rabbitmq --name rabbitmq \
      -e RABBITMQ_DEFAULT_USER=sensu \
      -e RABBITMQ_DEFAULT_PASS=sensu \
      -e RABBITMQ_DEFAULT_VHOST=/sensu \
      rabbitmq:3
    docker run -d --name redis redis:latest

### Start a sensu-server

    docker run -d --link=redis:redis --link=rabbitmq:rabbitmq warmfusion/sensu-server

### Start a sensu-client

    docker run -d --link=rabbitmq:rabbitmq warmfusion/sensu-client

#### Configuring Checks

You can define sensu-checks in the sensu-client by setting configuration files into the 
`/etc/sensu/conf.d` volume.

Remeber that you'll need to ensure that whatever check you run will be supported in
the container, so you'll most likely need to extend this container to run your custom 
checks to install dependencies.

### Start a sensu-api

    docker run -d --link redis:redis warmfusion/sensu-api

## Advanced 

You can configure some specific configuration for connecting to RabbitMQ, Redis or the API services with the following
environment variables.


    SENSU_TRANSPORT=rabbitmq://sensu:sensu@rabbitmq:5672/?vhost=/sensu
    SENSU_REDIS=redis://redis:6379
    SENSU_API=api://sensuapi:4567


### Nested Keys and RabbitMQ SSL Configuration

The sensu container includes a auto-configuration system which extracts a useful hash
configuration block out of a uri. 

Nested keys are supported by dotted string notation, for example, if you'd like to configure
the ssl hash for a RabbitMQ connection simply define the `SENSU_TRANSPORT` string as follows

    SENSU_TRANSPORT=rabbitmq://sensu:sensu@rabbitmq:5672/?vhost=/sensu&ssl.private_key_file=/etc/sensu/conf.d/ssl.key&ssl.cert_chain_file=/etc/sensu/conf.d/cert.pem
