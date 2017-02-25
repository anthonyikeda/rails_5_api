FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev unzip
RUN useradd consul

RUN wget https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_linux_amd64.zip \
      -O /tmp/consul_0.7.5_linux_amd64.zip && unzip /tmp/consul_0.7.5_linux_amd64.zip && \
      mv /consul /usr/bin
RUN mkdir /etc/consul.d && mkdir /var/run/consul
RUN chown consul:consul /var/run/consul

COPY service.json /etc/consul.d/service.json
COPY consul.service /etc/init.d/consul
COPY consul.json /etc/consul.conf
RUN mkdir /inventory_manager
WORKDIR /inventory_manager
ADD inventory_manager/Gemfile /inventory_manager/Gemfile
ADD inventory_manager/Gemfile.lock /inventory_manager/Gemfile.lock
RUN bundle install
COPY inventory_manager/ /inventory_manager
