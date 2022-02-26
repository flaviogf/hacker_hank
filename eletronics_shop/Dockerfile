FROM ruby:2.7.5
WORKDIR /www
COPY Gemfile* ./
RUN bundle
COPY . ./
CMD ["bin/app"]
