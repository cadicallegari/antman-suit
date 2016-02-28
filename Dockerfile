FROM ruby:2.2.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev \
libxml2-dev libxslt1-dev

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install bundler && bundle install

ADD . $APP_HOME
