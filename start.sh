#! /bin/bash -xe

consul agent -config-file /etc/consul.d/client/config.json &
rake db:migrate
puma -b tcp://0.0.0.0:9292
