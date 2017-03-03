FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev unzip
RUN curl -LO https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_linux_amd64.zip
RUN unzip consul_0.7.5_linux_amd64.zip && mv consul /usr/local/bin
RUN mkdir -p /etc/consul.d/client
ADD config.json /etc/consul.d/client
ADD start.sh /root/start.sh
RUN mkdir /inventory_manager
WORKDIR /inventory_manager
ADD inventory_manager/Gemfile /inventory_manager/Gemfile
ADD inventory_manager/Gemfile.lock /inventory_manager/Gemfile.lock
RUN bundle install
COPY inventory_manager/ /inventory_manager
RUN chmod +x /root/start.sh
