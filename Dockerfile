FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    graphviz \
    git \
    libpq-dev \
    postgresql-client \
    libvips \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN gem update --system && gem install bundler

WORKDIR /usr/src/app

ENTRYPOINT ["./bin/docker-entrypoint.sh"]

EXPOSE 4000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]