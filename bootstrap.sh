#!/bin/bash

bundle install
bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec shotgun app.rb
