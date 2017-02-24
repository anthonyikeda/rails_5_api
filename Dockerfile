FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev
RUN mkdir /inventory_manager
WORKDIR /inventory_manager
ADD inventory_manager/Gemfile /inventory_manager/Gemfile
ADD inventory_manager/Gemfile.lock /inventory_manager/Gemfile.lock
RUN bundle install
COPY inventory_manager/ /inventory_manager
