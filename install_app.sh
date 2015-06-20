#!/bin/bash

apt-add-repository -y  ppa:brightbox/ruby-ng
apt-get update
apt-get install -y ruby2.2 ruby2.2-dev
apt-get install -y g++

gem install bundler
bundle install
