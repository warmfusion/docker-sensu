# Sensu Containers

A set of sensu docker containers that can help provision automated checks of docker containers

## TODO

* Docker-compose to link and associate redis and rmq nodes

## Assumptions

### Consul

The configuration currently points at consul service addresses (eg sensu-redis.service.consul) with
an explicit port