FROM ruby:3.1.3-alpine

RUN apk update && apk upgrade
RUN apk add git bash

RUN mkdir /toy_robot_gem
ADD . /toy_robot_gem
WORKDIR /toy_robot_gem

RUN bundle install
RUN rake install
