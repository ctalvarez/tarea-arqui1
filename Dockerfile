FROM ruby:2.4.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /arqui2
WORKDIR /arqui2

ADD Gemfile /arqui2/Gemfile
ADD Gemfile.lock /arqui2/Gemfile.lock

RUN bundle install

ADD . /arqui2

ENV LISTEN_PORT=80

EXPOSE 80
CMD ["rails", "server", "-b", "0.0.0.0"]
