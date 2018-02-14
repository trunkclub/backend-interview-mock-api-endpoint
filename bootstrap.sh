#!/bin/bash

bundle install
bundle exec rake db:reset
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec shotgun app.rb
