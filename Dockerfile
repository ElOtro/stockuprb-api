FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y postgresql-client

WORKDIR /app

RUN gem install bundler
RUN bundle install

EXPOSE 4000

CMD ["bash"]