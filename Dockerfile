FROM ruby:latest

WORKDIR /webapp/api

ADD api/Gemfile api/Gemfile.lock ./

RUN bundle install
