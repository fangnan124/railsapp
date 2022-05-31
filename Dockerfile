FROM ruby:2.7.6
RUN apt-get update -qq && \
    apt-get install -y \
    nodejs

RUN mkdir /webapp
WORKDIR /webapp
ADD Gemfile /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . /webapp
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
