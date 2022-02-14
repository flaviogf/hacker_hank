FROM ruby:2.7.5
WORKDIR /www
COPY Gemfile* ./
RUN bundle
COPY . ./
EXPOSE 4567
CMD ["./bin/server"]
