FROM ruby:3.0.1

WORKDIR /usr/local/app

COPY Gemfile ./

COPY Gemfile.lock ./

RUN bundle

COPY . ./
