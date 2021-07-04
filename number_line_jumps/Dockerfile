FROM ruby:3.0

LABEL maintainer=flavio.fernandes6@gmail.com

WORKDIR /usr/local/app

COPY Gemfile* ./

RUN bundle install

COPY . .
