FROM ruby:2.4.2

# Устанавливаем необходимые гемы
ADD Gemfile /tmp/
WORKDIR /tmp
RUN bundle install

WORKDIR /usr/src/app