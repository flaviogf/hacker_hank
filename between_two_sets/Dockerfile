FROM ruby:3.0

WORKDIR /usr/local/app

COPY Gemfile* ./

RUN bundle install

COPY . ./
